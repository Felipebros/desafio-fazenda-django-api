from django.contrib import admin
from .models import Farmer


@admin.register(Farmer)
class FarmerAdmin(admin.ModelAdmin):
    list_display = ("name", "cpf_cnpj")
    search_fields = ("name", "cpf_cnpj")
