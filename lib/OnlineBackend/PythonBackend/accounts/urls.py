from django.urls import path
from .views import UserRecordView

app_name = 'accounts'
urlpatterns = [
    path('user/', UserRecordView.as_view(), name='users'),
]