from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class UsersConfig(AppConfig):
    name = "grupo_central_server.users"
    verbose_name = _("Users")

    def ready(self):
        try:
            import grupo_central_server.users.signals  # noqa F401
        except ImportError:
            pass
