from django.core.exceptions import ValidationError
from django.db import models
from django.utils.translation import gettext_lazy as _
from validate_docbr import CNPJ, CPF


class Farmer(models.Model):
    cpf_cnpj = models.CharField(
        "CPF/CNPJ",
        max_length=14,
        unique=True,
        help_text=_(
            "CPF (11 digits) or CNPJ (14 digits)",
        ),
    )
    name = models.CharField(max_length=255)

    class Meta:
        verbose_name = _("Farmer")
        verbose_name_plural = _("Farmers")
        ordering = ["name"]

    def __str__(self):
        return self.name

    def clean(self):
        super().clean()
        if self.cpf_cnpj:
            if len(self.cpf_cnpj) == 11:
                if not CPF().validate(self.cpf_cnpj):
                    raise ValidationError({"cpf_cnpj": _("Invalid CPF.")})
            elif len(self.cpf_cnpj) == 14:
                if not CNPJ().validate(self.cpf_cnpj):
                    raise ValidationError({"cpf_cnpj": _("Invalid CNPJ.")})
            else:
                raise ValidationError(
                    {
                        "cpf_cnpj": _(
                            "CPF must have 11 digits or CNPJ must have 14 digits."
                        )
                    }
                )
