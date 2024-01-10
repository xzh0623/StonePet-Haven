from .models import CustomUser  # 假設你有一個 UserProfile 模型存儲用戶信息

def custom_authentication(account, password):
    try:
        user = CustomUser.objects.get(username=account)

        if user.check_password(password):
            return user
        else:
            return None
    except CustomUser.DoesNotExist:
        return None
    