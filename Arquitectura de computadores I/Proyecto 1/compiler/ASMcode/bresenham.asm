.data


.text

#possibly change to color register
move 	$t6, 0x0000 	    # $t6 = 0x0000  color to paint the line

#Bresenham algorithm to draw lines from the point (xi, yi) to (xf, yf)
#this routine assumes all points are greater than 0 and lower than the resolution
bresenham: #($a0:xi, $a1:yi, $a2:xf, $a3:yf) 
sub		$t0, $a2, $a0		# dx= xf - xi
sub     $t1, $a3, $a1       # dy= yf - yi 

move 	$t3, $t0	        # $t3 = $t0
bge		$t0, $zero, absdx	# if dx >= 0 then absdx
sub		$t3, $zero, $t0		# $t3 = abs(dx)
absdx: #

move 	$t4, $t1		# $t4 = $t1
bge		$t1, $zero, absdy	# if dx >= 0 then absdy
sub		$t4, $zero, $t1		# $t4 = abs(dy)
absdy: #

bgt		$t4, $t3, plotHIGH	# if abs(dy) > abs(dx) then plotHIGH
#plotLOW
bge		$t0, $zero, bresenhamLOW	# if dx>=0 => xi<xf  then bresenhamLOW (arguments are in order)

#swap the arguments
move 	$t5, $a0		# $t5 = xi
move 	$a0, $a2		# $a0 = xf
move 	$a2, $t5		# $a2 = xi
move 	$t5, $a1		# $t5 = yi
move 	$a1, $a3		# $a1 = yf
move 	$a3, $t5		# $a3 = yi

j		bresenhamLOW				# jump to bresenhamLOW

#change in Y is greater that change in X
plotHIGH:

bge		$t1, $zero, bresenhamHIGH	# if dy>=0 => xi<xf  then bresenhamHIG (arguments are in order)

#swap the arguments
move 	$t5, $a0		# $t5 = xi
move 	$a0, $a2		# $a0 = xf
move 	$a2, $t5		# $a2 = xi
move 	$t5, $a1		# $t5 = yi
move 	$a1, $a3		# $a1 = yf
move 	$a3, $t5		# $a3 = yi

j		bresenhamHIGH				# jump to bresenhamLOW


##########################################################
bresenhamLOW: #($a0:xi, $a1:yi, $a2:xf, $a3:yf) 

move 	$t2, 1          	# yinc= 1 setup for increase increment
add		$t3, $t1, $t1		# $t3 = 2*dy
add		$t8, $t0, $t0		# $t8 = 2*dx


bge		$t1, $zero, brlincrease	# if dy >= zero then we increase the Y values                                       instead of decresing

#in case of decrease (dy<0)
move 	$t2, -1          	# yinc= -1
sub		$t1, $zero, $t1		# dy = -dy

brlincrease:

sub		$t7, $t1, $t0		# D = 2dy - dx

move 	$t4, $a1        	# y = yi
move 	$t5, $a0		    # x = x0

loopbrl:
bgt		$t5, $a2, end	    # if x > xf then end
ppxlc   $t5, $t4, $t6       #paint t6 on (t5,t6) => Mem[(x,y)] = $t6

bge		$zero, $t7, sameY	# if D <= 0 then sameY
add		$t4, $t4, $t2		# y = y + yinc
sub		$t7, $t7, $t8		# D = D - 2dx

sameY:
add		$t7, $t7, $t3		# D = D + 2dy

addi	$t5, $t5, 1         # increment x
j		loopbrl				# jump to loop



##########################################################
bresenhamHIGH: #($a0:xi, $a1:yi, $a2:xf, $a3:yf) 

move 	$t2, 1          	# xinc= 1 setup for increase increment
add		$t3, $t1, $t1		# $t3 = 2*dy
add		$t8, $t0, $t0		# $t8 = 2*dx


bge		$t0, $zero, brhincrease	# if dx >= zero then we increase the Y values                                       instead of decresing

#in case of decrease (dx<0)
move 	$t2, -1          	# xinc= -1
sub		$t0, $zero, $t0		# dx = -dx

brhincrease:

sub		$t7, $t8, $t1		# D = 2dx - dy

move 	$t4, $a1        	# y = yi
move 	$t5, $a0		    # x = xi

loopbrh:
#if
bgt		$t4, $a3, end	    # if y > yf then end
ppxlc   $t5, $t4, $t6       #paint t6 on (t5,t6) => Mem[(x,y)] = $t6

bge		$zero, $t7, sameX	# if D <= 0 then sameX
add		$t5, $t5, $t2		# x = x + xinc
sub		$t7, $t7, $t3		# D = D - 2dy

#endif
sameX:
add		$t7, $t7, $t8		# D = D + 2dx

addi	$t4, $t4, 1         # increment y
j		loopbrh				# jump to loop


end:

