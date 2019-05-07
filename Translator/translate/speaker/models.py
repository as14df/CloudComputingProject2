from django.db import models


# TODO: Hier können SIe eine Klasse anlegen, die Ihr Modell erzeugt

class  Ger_Eng_Dict(models.Model):
	german = models.CharField(max_length=4096)
	english = models.CharField(max_length=4096)

class  GuiInfo(models.Model):
    msg1 = models.CharField(max_length=4096)
    msg2 = models.CharField(max_length=4096)
    fromLang = models.CharField(max_length=256)
    toLang = models.CharField(max_length=256)



    # Fields
    # TODO Fügen Sie hier Ihre Felder ein 

    # Metadata
    #class Meta: 
    #    ordering = ['-my_field_name']

    # Methods
    #def get_absolute_url(self):
    #    """Returns the url to access a particular instance of MyModelName."""
    #    return reverse('model-detail-view', args=[str(self.id)])
    
    #def __str__(self):
    #    """String for representing the MyModelName object (in Admin site etc.)."""
    #    return self.my_field_name