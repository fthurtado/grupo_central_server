from django.urls import include, path

from rest_framework.routers import DefaultRouter

from grupo_central_server.diseases.api.allDiseases_view import GetDiseases

urlpatterns = []
router = DefaultRouter()

router.register("get-diseases", GetDiseases, basename="get-diseases")

urlpatterns += [
  path("", include(router.urls))
]