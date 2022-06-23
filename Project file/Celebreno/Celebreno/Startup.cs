using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Celebreno.Startup))]
namespace Celebreno
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
