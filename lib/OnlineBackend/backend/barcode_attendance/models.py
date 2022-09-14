from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Attendance(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    name = models.CharField(max_length=50, null=True, blank=True)
    details = models.TextField()
    time_and_date = models.DateTimeField(auto_now_add=True)
    cut_off_time = models.DateTimeField()
    
    def __str__(self):
        return self.name

    class Meta:
        ordering = ['-time_and_date']
        
        
class ScannedStudents(models.Model):
    attendance_id = models.ForeignKey(Attendance, related_name='attendances', on_delete=models.CASCADE)
    student_name = models.CharField(max_length=60)
    student_id_num = models.CharField(max_length=10)
    student_department = models.TextField()
    student_course = models.TextField()
    student_year = models.IntegerField()
    student_block = models.CharField(max_length=5)
    time_scanned = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return str(self.attendance_id) + " " + str(self.student_name) + " " + str(self.student_id_num)
    
    class Meta:
        ordering = ['-time_scanned']