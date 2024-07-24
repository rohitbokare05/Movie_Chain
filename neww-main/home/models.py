from django.db import models
from django.contrib.auth.models import User, AbstractUser, AbstractBaseUser

# from .models import CustomUser


class CustomUser(AbstractBaseUser):

    ethereum_address = models.CharField(max_length=42, unique=True)
    # Other fields and methods

    USERNAME_FIELD = "ethereum_address"
    REQUIRED_FIELDS = []


class Event(models.Model):
    name = models.CharField(max_length=200)
    date = models.DateTimeField()
    # image = models.ImageField(upload_to="event_images/")
    base_price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.name


class Ticket(models.Model):
    event = models.ForeignKey("Event", on_delete=models.CASCADE)
    ethereum_address = models.CharField(
        max_length=42, default="0x295F3804967aDe1Bb42b7D64d34e05b85918538a"
    )
    ticket_id = models.CharField(max_length=100)
    for_sale = models.BooleanField(default=True)
    # price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return f"{self.ticket_id} - {self.event.name}"
