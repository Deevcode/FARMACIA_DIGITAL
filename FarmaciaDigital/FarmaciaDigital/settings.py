from pathlib import Path
import os
from dotenv import load_dotenv
from decouple import config
################################################################################################################################################
load_dotenv()
################################################################################################################################################
# Build paths inside the project like this: BASE_DIR / 'subdir'.

BASE_DIR = Path(__file__).resolve().parent.parent
################################################################################################################################################
# SECURITY WARNING: keep the secret key used in production secret!

SECRET_KEY = os.environ.get('SECRET_KEY')
################################################################################################################################################
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
################################################################################################################################################
ALLOWED_HOSTS = []
################################################################################################################################################
MESSAGE_HOST = "django.contrib.messages.storage.cookie.CookieStorage"
################################################################################################################################################
LOGIN_REDIRECT_URL = '/'
LOGOUT_REDIRECT_URL = '/'
ADMIN_REDIRECT_URL = '/'
################################################################################################################################################
# Application definition
INSTALLED_APPS = [
    'admin_interface',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'app',
    'colorfield',
    'crispy_forms',
    'bootstrap4',
    'rest_framework',
    #'import_export',
    #'crispy_bootstrap4',
]
################################################################################################################################################
GOOGLE_MAPS_API_KEY =os.environ.get('GOOGLE_MAPS_API_KEY') 
################################################################################################################################################
CRISPY_ALLOWED_TEMPLATE_PACKS = "bootstrap4"
CRISPY_TEMPLATE_PACK = "bootstrap4"
################################################################################################################################################
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]
################################################################################################################################################
ROOT_URLCONF = 'FarmaciaDigital.urls'
################################################################################################################################################
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
################################################################################################################################################
WSGI_APPLICATION = 'FarmaciaDigital.wsgi.application'
################################################################################################################################################
#BASE DE DATOS ORACLE
DATABASES = {
    'default': {
        'ENGINE': os.environ.get('ENGINE'),
        'NAME': os.environ.get('NAME'),
        'USER': os.environ.get('USER'),
        'PASSWORD': os.environ.get('PASSWORD'),
        'TEST': {
            'USER': 'default_test',
            'TBLSPACE': 'default_test_tbls',
            'TBLSPACE_TEMP': 'default_test_tbls_temp',
        }
    }
}
################################################################################################################################################
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]
################################################################################################################################################
LANGUAGE_CODE = 'es-es'

TIME_ZONE = 'America/Santiago'

USE_I18N = True

USE_TZ = True
################################################################################################################################################
STATIC_URL = 'static/'

MEDIA_URL = '/media/'

MEDIA_ROOT = os.path.join(BASE_DIR, "media")
################################################################################################################################################

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
################################################################################################################################################
AUTH_USER_MODEL = 'app.Usuario'
################################################################################################################################################
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = os.environ.get('EMAIL_HOST_USER')   # Tu dirección de correo electrónico
EMAIL_HOST_PASSWORD = os.environ.get('EMAIL_HOST_PASSWORD')  # Tu contraseña de correo electrónico
EMAIL_USE_TLS = True
DEFAULT_FROM_EMAIL = os.environ.get('DEFAULT_FROM_EMAIL')  # Dirección de correo electrónico para enviar los correos