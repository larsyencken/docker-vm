%
%  docker-vm.pl
%  docker-vm
%
%  Dependencies for setting up docker-vm.
%

meta_pkg('docker-vm', [
    'lxc-docker'
]).

managed_pkg('lxc-docker').
depends('lxc-docker', linux(_), [
    '__docker apt source added'
]).

pkg('__docker apt source added').
met('__docker apt source added', _) :-
    bash('diff -q /vagrant/marelle-deps/docker.list /etc/apt/sources.list.d/docker.list').
meet('__docker apt source added', _) :-
    sudo('cp -f /vagrant/marelle-deps/docker.list /etc/apt/sources.list.d/docker.list'),
    sudo('sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"').
