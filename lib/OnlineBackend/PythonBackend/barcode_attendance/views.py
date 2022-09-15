import re
from django.shortcuts import render
from django.views.generic.list import ListView
from .models import Attendance

# Create your views here.

from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import AttendanceSerializer, ScannedStudentsSerializer
from .models import Attendance, ScannedStudent
from django.contrib.auth.decorators import login_required

from django.contrib.auth.views import LoginView
# Create your views here.

@api_view(['GET'])
def getRoutes(request):
    routes = [
        {
            'Endpoint': '/attendance/',
            'method': 'GET',
            'attendance_name': None,
            'students_added': None,
            'timeStamp': None,
            'description': 'Returns array of attendance created'
        },
        {
            'Endpoint': '/attendance/id',
            'method': 'GET',
            'attendance_id': None,
            'timeStamp': None,
            'description': 'Returns single attendance from id'
        },
        {
            'Endpoint': '/attendance/create',
            'method': 'POST',
            'attendance_name': {'attendance_name': ""},
            'timeStamp': None,
            'description': 'Creates new attendance'
        },
        {
            'Endpoint': '/attendance/id/update',
            'method': 'PUT',
            'attendance_name': {'attendance_name': ""},
            'timeStamp': None,
            'description': 'Updates attendance'
        },
        {
            'Endpoint': '/attendance/id/delete',
            'method': 'DELETE',
            'attendance_name': None,
            'timeStamp': None,
            'description': 'Deletes attendance'
        }
    ]
    return Response(routes)


# @login_required
@api_view(['GET'])
def getAttendances(request):
    attendances = Attendance.objects.filter(user=request.user)
    serializer = AttendanceSerializer(attendances, many=True)
    return Response(serializer.data)

# @login_required
@api_view(['GET'])
def getSingleAttendanceContent(request, pk):
    attendance = Attendance.objects.filter(attendance_id=pk)
    serializer = ScannedStudentsSerializer(attendance, many=True)
    return Response(serializer.data)

@login_required
@api_view(['POST'])
def createAttendance(request):
    data = request.data
    attendance = Attendance.objects.create(
        attendance_name = data['attendance_name']
    )
    serializer = AttendanceSerializer(attendance, many=False)
    return Response(serializer.data)
   
@login_required 
@api_view(['DELETE'])
def deleteAttendance(request, pk):
    attendance = Attendance.objects.get(id=pk)
    attendance.delete();
    return Response("Attendance is deleted!")

# @login_required
# Add student to already created attendance in models.py
@api_view(['POST'])
def addStudent(request, pk):
    data = request.data
    attendance = Attendance.objects.get(id=pk)
    attendance_content = ScannedStudent.objects.create(
        attendance_id = attendance,
        student_name = data['student_name'],
        student_id = data['student_id']
    )
    serializer = ScannedStudentsSerializer(attendance_content, many=False)
    return Response(serializer.data)
