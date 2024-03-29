﻿using Android.App;
using Android.Widget;
using Android.OS;
using Android.Webkit;
using Android.Runtime;
using Android.Views;

namespace AppCT
{
    [Activity(Label = "AppCT", MainLauncher = true, Theme = "@android:style/Theme.NoTitleBar")]
    public class MainActivity : Activity
    {
        private WebView web_view;
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.Main);
            web_view = FindViewById<WebView>(Resource.Id.webview);
            web_view.Settings.JavaScriptEnabled = true;
            web_view.LoadUrl("https://www.google.com/");
            web_view.SetWebViewClient(new HelloWebViewClient());

            // Set our view from the "main" layout resource
            // SetContentView (Resource.Layout.Main);
        }

        public class HelloWebViewClient : WebViewClient
        {
            public override bool ShouldOverrideUrlLoading(WebView view, string url)
            {
                view.LoadUrl(url);
                return true;
            }
        }

        public override bool OnKeyDown(Android.Views.Keycode keyCode, Android.Views.KeyEvent e)
        {
            if (keyCode == Keycode.Back && web_view.CanGoBack())
            {
                web_view.GoBack();
                return true;
            }
            return base.OnKeyDown(keyCode,e);
        }

    }
}

