from django.urls import path
from .views import UpdateProfileView, PasswordResetRequestView, PasswordResetConfirmView

urlpatterns = [
    path('update_profile/', UpdateProfileView.as_view(), name='update_profile'),
    path('password_reset/', PasswordResetRequestView.as_view(), name='password_reset_request'),
    path('reset/<uidb64>/<token>/', PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
]
