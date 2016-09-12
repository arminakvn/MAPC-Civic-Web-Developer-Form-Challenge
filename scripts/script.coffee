validationRules = fields:
  first_name:
    identifier: 'first_name'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter your first name'
    } ]
  last_name:
    identifier: 'last_name'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter your last name'
    } ]
  project_name:
    identifier: 'project_name'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter a project name'
    } ]
  organization_name:
    identifier: 'organization_name'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter a  name'
    } ]
  email:
    identifier: 'email'
    rules: [ {
      type: 'empty'
      prompt: 'Please enter a email'
    } ]
  password:
    identifier: 'password'
    rules: [
      {
        type: 'empty'
        prompt: 'Please enter a password'
      }
      {
        type: 'minLength[6]'
        prompt: 'Your password must be at least {ruleValue} characters'
      }
    ]
getFieldValue = (fieldId) ->
  $('.ui.form').form('get field', fieldId).val()

onFormSubmitted = (response) ->
  console.log "response in client", response
  return

submitForm = ->
  formData = email: getFieldValue('email')
  console.log "formData", formData
  $.ajax
    type: 'GET'
    url: '/forminputemail/#{formData.email}'
    success: onFormSubmitted
  return

$('.ui.form').form validationRules, onSuccess: submitForm