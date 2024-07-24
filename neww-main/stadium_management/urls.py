from django.urls import path
from django.contrib import admin
from home import views

urlpatterns = [
    path("", views.index, name="index"),
    path("issue_ticket/<int:event_id>/", views.issue_ticket, name="issue_ticket"),
    path("create_event/", views.create_event, name="create_event"),
    path("buy_ticket/<int:ticket_id>/", views.buy_ticket, name="buy_ticket"),
    path("cancel_ticket/<int:ticket_id>/", views.cancel_ticket, name="cancel_ticket"),
    path("ongoing_events/", views.ongoing_events, name="ongoing_events"),
    path("admin/", admin.site.urls),
    path("login", views.login, name="login"),
    # path("register", views.register, name="register"),
    # path("connect_to_metamask/"),
    path("api/save-account/", views.save_account, name="save_account"),
    path("my_tickets/", views.my_tickets, name="my_tickets"),
    # path("profile/", views.profile, name="profile"),
    path("my_tickets/", views.my_tickets, name="my_tickets"),
    path("buy_seat/<int:event_id>/", views.buy_seat, name="buy_seat"),
    # path("authenticate/", views.authenticate_user, name="authenticate"),
]
