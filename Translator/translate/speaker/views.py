from django.shortcuts import render
from django.template import loader
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.views import generic
from django.views.decorators.csrf import csrf_exempt,csrf_protect
from google.cloud import translate

from .models import GuiInfo, Ger_Eng_Dict

@csrf_exempt
def index(request):

    # Get object to send to view
    trans = GuiInfo(msg1 = "", msg2 = "")

    # Get Language to translate to and translate from
    trans.fromLang = request.POST.get("fromLang", "Deutsch")
    trans.toLang = request.POST.get("toLang", "Englisch")

    # Get text to translate
    msg1 = request.POST.get("msg1", "");

    # Check if user clicked translate button
    if 'translate' in request.POST:
        # Check if theres text to get translated
        if msg1 != "":
            try:
                if trans.fromLang == "Deutsch":
                    # Get translation english from database
                    trans.msg1 = msg1
                    translation = Ger_Eng_Dict.objects.get(german = msg1)
                    trans.msg2 = translation.english
                else:
                    # Get translation german from database
                    trans.msg1 = msg1
                    translation = Ger_Eng_Dict.objects.get(english = msg1)
                    trans.msg2 = translation.german
            except Exception as e:
                # If this exception raises, the translation could not be found in the database
                translate_client = translate.Client() 
                translation = ""

                # Get translation from google API and save result to databse object
                if trans.fromLang == "Deutsch":
                    translation = translate_client.translate(msg1, target_language='en')
                    obj = Ger_Eng_Dict(german=msg1, english=translation['translatedText'])               
                else:
                    translation = translate_client.translate(msg1, target_language='ger')
                    obj = Ger_Eng_Dict(german=translation['translatedText'], english=msg1)

                # Save the result in the database
                obj.save()
                trans.msg2 = translation['translatedText']                            
    elif 'changeLang' in request.POST:
        # Change translation direction
        b = trans.toLang
        trans.toLang = trans.fromLang
        trans.fromLang = b;

    return render(request, 'speaker/index.html', {'trans': trans})

def about(request):
    # Show about site
    return render(request, 'speaker/about.html', None)