from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse
from .models import *
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.decorators import login_required
import json
from django.views.decorators.csrf import csrf_exempt
from web3_integration import *
from accounts.forms import EventForm
from datetime import datetime


# # @csrf_exempt
# # def authenticate_user(request):
#     print("Dhruvi")
#     if request.method == "POST":
#         try:
#             data = json.loads(request.body)
#             address = data.get("address")
#             signature = data.get("signature")
#             message = data.get("message")

#             # Initialize Web3 instance
#             w3 = Web3()

#             # Verify the signature
#             recovered_address = w3.eth.account.recover_message(
#                 message, signature=signature
#             )

#             if recovered_address.lower() == address.lower():
#                 user, created = CustomUser.objects.get_or_create(
#                     ethereum_address=address
#                 )
#                 if created:
#                     user.username = f"user_{address}"  # Example username
#                     user.save()

#                 # Authenticate and log in the user
#                 user = authenticate(request, username=user.username)
#                 if user:
#                     login(request, user)
#                     return JsonResponse({"status": "success", "address": address})
#                 else:
#                     return JsonResponse(
#                         {"status": "error", "message": "Authentication failed"},
#                         status=400,
#                     )
#             else:
#                 return JsonResponse(
#                     {"status": "error", "message": "Invalid signature"}, status=400
#                 )
#         except json.JSONDecodeError:
#             return JsonResponse(
#                 {"status": "error", "message": "Invalid JSON"}, status=400
#             )
#         except Exception as e:
#             print("error")
#             return JsonResponse({"status": "error", "message": str(e)}, status=500)

#     return JsonResponse({"status": "error", "message": "Invalid method"}, status=405)


# @login_required
def index(request):
    return render(request, "first_page.html")


def issue_ticket(request, event_id, base_price):
    for i in range(5):
        contract_issue_ticket(i, base_price)

        Ticket.objects.create(
            event_id=event_id,
            ticket_id=i,
        ethereum_address="0x295F3804967aDe1Bb42b7D64d34e05b85918538a",
        )
    messages.success(request, "Ticket issued successfully.")
    return redirect("ongoing_events")


def create_event(request):
    if request.method == "POST":
        print(contract_address)

        name = request.POST["name"]
        date = request.POST["date"]
        # image = request.FILES["image"]
        base_price = int(request.POST["base_price"])

        last_event = Event.objects.last()
        if last_event:
            event_ID = last_event.id + 1
        else:
            event_ID = 1

        event = Event.objects.create(
            name=name, date=date, base_price=base_price, id=event_ID
        )
        issue_ticket(request, event_ID, base_price)

        messages.success(request, "Event created successfully.")
        return redirect("ongoing_events")
    else:
        return render(request, "create_event.html", {"form": EventForm})


def ongoing_events(request):
    events = Event.objects.filter(date__gt=datetime.now())
    return render(request, "ongoing_events.html", {"events": events})


def buy_seat(request, event_id):
    seats = Ticket.objects.filter(for_sale=True, event_id=event_id)
    return render(request, "buy_seat.html", {"seats": seats})


def buy_ticket(request, ticket_id):
    contract_buy_ticket(ticket_id)
    return redirect("profile/")


def my_tickets(request):
    tickets = Ticket.objects.filter(owner=request.user)
    return render(request, "my_tickets.html", {"tickets": tickets})


def cancel_ticket(request, ticket_id):
    contract_cancel_ticket(ticket_id)
    return redirect("profile/")


@csrf_exempt
def save_account(request):
    if request.method == "POST":
        try:
            data = json.loads(request.body)
            account = data.get("account")
            # Process the account data (e.g., save to database)
            print("Received account:", account)
            return JsonResponse({"status": "success"})
        except json.JSONDecodeError:
            return JsonResponse(
                {"status": "error", "message": "Invalid JSON"}, status=400
            )
    return JsonResponse(
        {"status": "error", "message": "Invalid request method"}, status=400
    )
