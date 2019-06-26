using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ConstruTEC.HttpHelper
{
    public class HelperController : ApiController
    {
        public static HttpResponseMessage newHttpResponse(string newHttpMessage, HttpStatusCode newStatus = HttpStatusCode.OK)
        {
            HttpResponseMessage httpResponse = new HttpResponseMessage();
            httpResponse.Content = new StringContent(newHttpMessage, System.Text.Encoding.UTF8, "application/json");
            httpResponse.StatusCode = newStatus;
            return httpResponse;
        }
    }
}
