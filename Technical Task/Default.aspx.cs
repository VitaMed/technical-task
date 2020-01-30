using System;
using System.Net;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Newtonsoft.Json;

namespace Technical_Task
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadJson();
        }
        public void LoadJson()
        {
            using (StreamReader r = new StreamReader(Server.MapPath(Request.ApplicationPath) + "\\Content\\filtered_cities.json"))
            {
                string json = r.ReadToEnd();
                List<Item> items = JsonConvert.DeserializeObject<List<Item>>(json);
                foreach (var item in items)
                {
                    if (item.country == "UA")
                    {
                        txtCity.Items.Add(new ListItem(item.name));
                    }
                }
            }
        }

        public class Item
        {
            public int id;
            public string name;
            public string country;
            public Coord coord; 
        }
       
        protected void SendtoEmail(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Login");
        }
            protected void GetWeatherInfo(object sender, EventArgs e)
        {
            string url = string.Format("http://api.openweathermap.org/data/2.5/weather?q={0}&APPID=a70bf26a352ed19b69a30b04a450b0ee", txtCity.SelectedValue);
            using (WebClient client = new WebClient())
            {
                string json = client.DownloadString(url);
                if (json.IndexOf("Error") == -1)
                {
                    WeatherInfo weatherInfo = (new JavaScriptSerializer()).Deserialize<WeatherInfo>(json);
                    lblCity_Country.Text = weatherInfo.name + "," + weatherInfo.sys.country;
                    imgCountryFlag.ImageUrl = string.Format("http://openweathermap.org/images/flags/{0}.png", weatherInfo.sys.country.ToLower());
                    lblDescription.Text = weatherInfo.weather[0].description;
                    imgWeatherIcon.ImageUrl = string.Format("http://openweathermap.org/img/w/{0}.png", weatherInfo.weather[0].icon);
                    lblTemperature.Text = string.Format("{0} °C", Math.Round(weatherInfo.main.temp - 273.15, 1));
                    lblTempMin.Text = string.Format("{0} °C", Math.Round(weatherInfo.main.temp_min - 273.15, 1));
                    lblTempMax.Text = string.Format("{0} °C", Math.Round(weatherInfo.main.temp_max - 273.15, 1));
                    WindTxt.Text = weatherInfo.wind.speed.ToString();
                    lblHumidity.Text = weatherInfo.main.humidity.ToString();
                    Date.Text = DateTime.Now.DayOfWeek.ToString();
                    tblWeather.Visible = true;
                }
            }
        }

        public class WeatherInfo
        {
            public Coord coord { get; set; }
            public Wind wind { get; set; }
            public Sys sys { get; set; }
            public List<Weather> weather { get; set; }
            public Main main { get; set; }
            public int dt { get; set; }
            public string name { get; set; }
        }
        public class Wind
        {
            public double speed  { get; set; }
            public double deg  { get; set; }
    }
        public class Coord
        {
            public double lon { get; set; }
            public double lat { get; set; }
        }

        public class Sys
        {
            public string country { get; set; }
        }

        public class Weather
        {
            public string main { get; set; }
            public string description { get; set; }
            public string icon { get; set; }
        }

        public class Main
        {
            public double temp { get; set; }
            public double temp_min { get; set; }
            public double temp_max { get; set; }
            public int humidity { get; set; }
        }
        protected void ShowRate(object sender, EventArgs e)
        {
            string url = string.Format("http://api.currencylayer.com/live?access_key=094dba8bb53990b884139ba310ac3f76&currencies=EUR,GBP,CAD,PLN&format=1");
            WebClient client = new WebClient();
            string rates = client.DownloadString(url);
            RateInfo rate = new JavaScriptSerializer().Deserialize<RateInfo>(rates);
            GBP.Text = string.Format(""+Math.Round(rate.quotes.USDGBP,1));
            CAD.Text = string.Format(""+Math.Round(rate.quotes.USDCAD, 1));
            PLN.Text = string.Format(""+Math.Round(rate.quotes.USDPLN, 1));
            EUR.Text = string.Format(""+Math.Round(rate.quotes.USDEUR, 1));
            
            tblRate.Visible = true;
        }

        public class RateInfo
        {
            public string source { get; set; }
            public Quotes quotes { get; set; }
        }
        public class Quotes
        {
            public double USDEUR { get; set; }
            public double USDGBP { get; set; }
            public double USDCAD { get; set; }
            public double USDPLN { get; set; }
        }
    }
    
}