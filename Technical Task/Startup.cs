using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Technical_Task.Startup))]
namespace Technical_Task
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
