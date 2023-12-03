from django.contrib import admin
from .models import *

@admin.register(Sensor)
class SensorAdmin(admin.ModelAdmin):
    list_display = ('type_of_sensor', 'device')
    readonly_fields = ('id',)

@admin.register(Device)
class DeviceAdmin(admin.ModelAdmin):
    list_display = ('name', 'user')
    readonly_fields = ('id',)

@admin.register(File)
class FileAdmin(admin.ModelAdmin):
    list_display = ('timestamp', 'file')

@admin.register(Analytics)
class AnalyticsAdmin(admin.ModelAdmin):
    list_display = ('timestamp', 'sensor')
    readonly_fields = ('timestamp', 'id',)

@admin.register(Sensor_Reading)
class Sensor_ReadingAdmin(admin.ModelAdmin):
    list_display = ('time', 'sensor')
    readonly_fields = ('time', 'id',)

@admin.register(Sensor_Reading_File)
class Sensor_ReadingFileAdmin(admin.ModelAdmin):
    list_display = ('user', 'sensor_type', 'time')
    readonly_fields = ('id',)

@admin.register(Schema)
class SchemaAdmin(admin.ModelAdmin):
    list_display = ('category', 'table')

@admin.register(Questionnaire)
class QuestionnaireAdmin(admin.ModelAdmin):
    list_display = ('app', 'title')
    readonly_fields = ('id',)

@admin.register(Responses)
class ResponsesAdmin(admin.ModelAdmin):
    list_display = ('questions', 'user')
    readonly_fields = ('id',)
