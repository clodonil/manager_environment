Name:       Apphello
Version:    0.0.1
Release:    1
Summary:    Aplicativo para validar variável de ambiente
License:    FIXME

%description
Aplicativo para validar variável de ambiente

%prep
# we have no source, so nothing here

%build
#

%install
mkdir -p %{buildroot}/opt/apphello
cp -r ${source} %{buildroot}/opt/apphello/
install -m 755 run.py %{buildroot}/opt/apphello/run.py

%files
/opt/apphello/run.py

%changelog
# let skip this for now