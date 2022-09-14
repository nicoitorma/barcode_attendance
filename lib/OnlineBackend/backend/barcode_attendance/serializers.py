from rest_framework import serializers
from .models import Attendance

class AttendanceSerializer(serializers.Serializer):
    id = serializers.IntegerField(read_only=True)
    name = serializers.CharField(max_length=50)
    students_count = serializers.SerializerMethodField()
    details = serializers.CharField(max_length=100)
    time_and_date = serializers.DateTimeField()
    cut_off_time = serializers.DateTimeField()
        
    
    class Meta:
         model = Attendance
         fields = ('id','name', 'students_count', 'details', 'time_and_date', 'cut_off_time')
         
    def get_students_count(self, obj):
        return obj.attendances.count()


class ScannedStudentsSerializer(serializers.Serializer):
    attendance_id = serializers.CharField(max_length=50)
    student_name = serializers.CharField(max_length=60)
    student_id_num = serializers.CharField(max_length=10)
    time_scanned = serializers.DateTimeField()
    student_department = serializers.CharField(max_length=50)
    student_course = serializers.CharField(max_length=5)
    student_year = serializers.IntegerField()
    student_block = serializers.CharField(max_length=5)
    