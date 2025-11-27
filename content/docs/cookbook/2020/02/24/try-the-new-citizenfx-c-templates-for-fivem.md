---
title: Try the new CitizenFX C# templates for FiveM
date: 2020-02-24T15:08:22.000+01:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **February 24, 2020**. Newer information may exist.
{{< /alert >}}

We've recently published the [CitizenFX.Templates package](https://www.nuget.org/packages/CitizenFX.Templates/) on NuGet, which includes a nice template for making a fully C#-based resource using the latest recommendations. The docs will be updated whenever more people confirm this works and report some feedback as to this, but for now here's the steps to set it up:

```
dotnet new -i CitizenFX.Templates
mkdir MyResource
cd MyResource
dotnet new cfx-resource
```

You'll find helpful instructions afterwards in the generated `README.md`.
