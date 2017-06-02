Being a shared instance, there are global dependencies installed on to the box (for instance, Node, Ruby). These issues have previously been tackled with *envs, such as nodenv and rbenv. In theory this should solve the problem, but there is no "CentOSenv"! This has the potential to cause problems as we upgrade our projects to use CentOS7; when we build CentOS6 packages for CentOS7 targets.

The solution for nav-promo, was to build the RPM in a CentOS7 Docker container. This process isolates the nav-promo 
