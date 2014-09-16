$(document).ready ->
  $("#quoteform").bootstrapValidator fields:
    email:
      message: "Invalid email"
      validators:
        notEmpty:
          message: "The email is required and cannot be empty"
        remote:
          message: "The email is not valid"
          url: "/checkemail"

  $("#ccForm").bootstrapValidator
    feedbackIcons:
      valid: "glyphicon glyphicon-ok"
      invalid: "glyphicon glyphicon-remove"
      validating: "glyphicon glyphicon-refresh"

    fields:
      cardholdername:
        message: "The name is not valid"
        validators:
          notEmpty:
            message: "The name is required and cannot be empty"
      cc:
        validators:
          notEmpty:
            message: "The credit card number is required and cannot be empty"
          creditCard:
            message: "The credit card number is not valid"
      cvv:
        validators:
          notEmpty:
            message: "The cvv is required and cannot be empty"
          cvv:
            creditCardField: "cc"
            message: "The CVV number is not valid"

  return