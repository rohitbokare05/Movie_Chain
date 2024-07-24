from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from home.models import Event


# class RegisterForm(UserCreationForm):
#     email = forms.EmailField(required=True)

#     class Meta:
#         model = User
#         fields = ["username", "email", "password1", "password2"]

#     def clean_email(self):
#         email = self.cleaned_data.get("email")
#         if User.objects.filter(email=email).exists():
#             raise forms.ValidationError("Email already in use.")
#         return email


# class Event(models.Model):
#     name = models.CharField(max_length=200)
#     date = models.DateTimeField()
#     image = models.ImageField(upload_to="event_images/")
#     base_price = models.DecimalField(max_digits=10, decimal_places=2)

#     def __str__(self):
#         return self.name


class EventForm(forms.ModelForm):
    class Meta:
        model = Event
        fields = ["name", "date", "base_price"]
        widgets = {
            "date": forms.DateTimeInput(attrs={"type": "datetime-local"}),
        }
        labels = {
            "name": "Event Name",
            "date": "Event Date",
            # "image": "Event Image",
            "base_price": "Base Price",
        }
        # help_texts = {
        #     "name": "Enter the name of the event",
        #     "date": "Enter the date and time of the event",
        #     "image": "Upload an image for the event",
        #     "base_price": "Enter the base price of the ticket",
        # }
