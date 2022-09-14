from unicodedata import name
from django.urls import path
from . import views


urlpatterns = [
    path('lists/', views.getAttendances, name='attendance_list')
]