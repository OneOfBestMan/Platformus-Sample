// Copyright © 2015 Dmitry Sikorsky. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace WebApplication
{
  public class Startup : Platformus.WebApplication.Startup
  {
    public Startup(IServiceProvider serviceProvider)
      : base(serviceProvider)
    {
      this.serviceProvider.GetService<ILoggerFactory>().AddConsole();
    }

    public override void ConfigureServices(IServiceCollection services)
    {
      base.ConfigureServices(services);
    }

    public override void Configure(IApplicationBuilder applicationBuilder)
    {
      base.Configure(applicationBuilder);
    }
  }
}