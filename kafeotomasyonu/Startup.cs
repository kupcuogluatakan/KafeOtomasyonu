using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(kafeotomasyonu.Startup))]
namespace kafeotomasyonu
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
