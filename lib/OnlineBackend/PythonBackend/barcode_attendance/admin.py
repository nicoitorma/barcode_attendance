from re import A
from django.contrib import admin
from .models import Attendance, ScannedStudent

# Register your models here.
admin.site.register(Attendance)
admin.site.register(ScannedStudent)