from pyramid.view import view_config
import os

class IwalkBionicViews:
    def __init__(self, request):
        self.request = request
        self.reply = {}

    @view_config(route_name='index', renderer='views/index.pt')
    def index(self):
        title = 'iWalk Bionic'
        description = 'iWalk Bionic is developing an exoskeleton prototype to assist patients with paraplegia (motor function loss below the waist) and hemiplegia (motor function loss in one side of the body) to regain motor function. Please sign up for news update if you are interested.'
        self.reply['browser_title'] = title
        self.reply['meta_description'] = description
        self.reply['meta_keyword'] = 'bionic leg, exoskeleton, paraplegia, hemiplegia'
        self.reply['title'] = title
        self.reply['main_description'] = description
        self.reply['required'] = 'indicates a required field'
        self.reply['name'] = 'Name'
        self.reply['email'] = 'Email'
        self.reply['personal_need'] = 'I want to learn more for myself'
        self.reply['for_family'] = 'I want to learn more for a family member'
        self.reply['for_friend'] = 'I want to learn more for a friend'
        self.reply['submit'] = 'Submit'
        self.reply['email_sent'] = ''
        if 'requester-name' in self.request.params:
            request_name = self.request.params['requester-name']
            request_email = self.request.params['requester-email']
            request_reason = self.request.params['requester-reason']
            email_message = """Name {}
Email {}
Reason for inquiry {}
""".format(request_name, request_email, request_reason)
            email_command = 'echo "{}" | mail -s "iWalk Bionic product info sign up" -aFrom:"{}"\<{}\> goku3ty@hotmail.com'.format(email_message, request_name, request_email)
            os.system(email_command)
            self.reply['email_sent'] = 'Thank you for your interest. We have received your sign up and we will get back to you when we are ready.'

        return self.reply
