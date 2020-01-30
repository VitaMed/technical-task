using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Technical_Task.Models;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.IO;
using Newtonsoft.Json;
using System.Web.UI.WebControls;

namespace Technical_Task.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                // RegisterHyperLink.NavigateUrl = "Register";
            // Включите, когда будет включено подтверждение учетной записи для функции сброса пароля
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
              //  RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
            LoadJson();
        }

        protected void LogIn(object sender, EventArgs e)
        {
            
            MailMessage newMail = new MailMessage();
            newMail.To.Add(Email.Text.Trim());
            string message="";

            string url1 = string.Format("http://api.openweathermap.org/data/2.5/weather?q={0}&APPID=a70bf26a352ed19b69a30b04a450b0ee", txtCity.SelectedValue.Trim());
            string url2 = string.Format("http://api.currencylayer.com/live?access_key=094dba8bb53990b884139ba310ac3f76&currencies=EUR,GBP,CAD,PLN&format=1");

            using (WebClient client = new WebClient())
            {
                string json = client.DownloadString(url1);
                string rates = client.DownloadString(url2);
                if ((json.IndexOf("Error") == -1)&&(rates.IndexOf("Error") == -1))
                {
                    _Default.WeatherInfo weatherInfo = (new JavaScriptSerializer()).Deserialize<_Default.WeatherInfo>(json);
                    _Default.RateInfo rate = new JavaScriptSerializer().Deserialize<_Default.RateInfo>(rates);

                    message =  weatherInfo.name + "," + weatherInfo.sys.country+ "<br>" +
                        " Description: "+ weatherInfo.weather[0].description + "<br>" + 
                        " Temperature: " +string.Format("{0} К", Math.Round(weatherInfo.main.temp, 1)) + " (Min: "+
                            string.Format("{0} К", Math.Round(weatherInfo.main.temp_min, 1))+" Max: " +string.Format("{0} К", Math.Round(weatherInfo.main.temp_max, 1)) + ")"+ "<br>"
                        + " Humidity:  "+ weatherInfo.main.humidity.ToString()+ "<br>"+ "<br>" + 
                        "Currency Rate:"+"<br>"+
                        "USD - GBP: "+string.Format("" + Math.Round(rate.quotes.USDGBP, 1)) + "<br>"+
                        "USD - CAD: " + string.Format("" + Math.Round(rate.quotes.USDCAD, 1)) + "<br>" +
                        "USD - PLN: " + string.Format("" + Math.Round(rate.quotes.USDPLN, 1)) + "<br>" +
                        "USD - EUR: "+string.Format("" + Math.Round(rate.quotes.USDEUR, 1));
                }
            }
 
            newMail.Subject = "Weather and Currency Rate";
            newMail.Body = message;
            newMail.From = new MailAddress("testmedov@gmail.com", "Vita");
            newMail.IsBodyHtml = true;

            SmtpClient SmtpSender = new SmtpClient();
            SmtpSender.Port = 587; //or, whatever port your SMTP server operates on
            SmtpSender.Host = "smtp.gmail.com";
            SmtpSender.EnableSsl = true;
            SmtpSender.DeliveryMethod = SmtpDeliveryMethod.Network;
            SmtpSender.UseDefaultCredentials = false;
            SmtpSender.Credentials = new NetworkCredential(newMail.From.Address, "123456test");
            SmtpSender.Send(newMail);
            Email.Text = "";
            Number.Text = "";
            Name.Text = "";
            Response.Write(@"<script language='javascript'>alert('Information was sent to your E-mail!');</script>");

        }
        public void LoadJson()
        {
            using (StreamReader r = new StreamReader(Server.MapPath(Request.ApplicationPath) + "\\Content\\filtered_cities.json"))
            {
                string json = r.ReadToEnd();
                List<_Default.Item> items = JsonConvert.DeserializeObject<List<_Default.Item>>(json);
                foreach (var item in items)
                {
                    if (item.country == "UA")
                    {
                        txtCity.Items.Add(new ListItem(item.name));
                    }
                }
            }
        }

    }
}