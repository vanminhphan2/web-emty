using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WineStoreWeb.Startup))]
namespace WineStoreWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
