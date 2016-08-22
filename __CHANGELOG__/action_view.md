# ActionView


1. Change datetime_field and datetime_field_tag to generate datetime-local fields.
    - As a new specification of the HTML 5 the text field type datetime will no longer exist and it is recomended to use datetime-local. Ref: https://html.spec.whatwg.org/multipage/forms.html#local-date-and-time-state-(type=datetime-local)
1. Raw template handler (which is also the default template handler in Rails 5) now outputs HTML-safe strings.
    - In Rails 5 the default template handler was changed to the raw template handler. Because the ERB template handler escaped strings by default this broke some applications that expected plain JS or HTML files to be rendered unescaped. This fixes the issue caused by changing the default handler by changing the Raw template handler to output HTML-safe strings.
1. select_tag's include_blank option for generation for blank option tag, now adds an empty space label, when the value as well as content for option tag are empty, so that we confirm with html specification. Ref: https://www.w3.org/TR/html5/forms.html#the-option-element.
    - Generation of option before: `<option value=""></option>`
    - Generation of option after: `<option value="" label=" "></option>`
1. date_select helper :with_css_classes option now accepts a hash of strings for :year, :month, :day, :hour, :minute, :second that will extend the select type with the given css class value.

    ```
    <%= f.date_select :birthday, with_css_classes: { month: "my-month", year: "my-year" } %>
    <select id="user_birthday_3i" name="user[birthday(3i)]">…</select>
    <select id="user_birthday_2i" name="user[birthday(2i)]" class="my-month">…</select>
    <select id="user_birthday_1i" name="user[birthday(1i)]" class="my-year">…</select>
    ```
1. Add to_sentence helper that is a HTML-safe aware version of Array#to_sentence.
1. Added log "Rendering ...", when starting to render a template to log that we have started rendering something. This helps to easily identify the origin of queries in the log whether they came from controller or views.
1. Add support for nested hashes/arrays to :params option of button_to helper.
1. Fix collection_radio_buttons hidden_field name and make it appear before the actual input radio tags to make the real value override the hidden when passed.
1. Allow date_select helper selected option to accept hash like the default options.
1. Collection input propagates input's id to the label's for attribute when using html options as the last element of collection.
1. Add a hidden_field on the collection_radio_buttons to avoid raising an error when the only input on the form is the collection_radio_buttons.
1. url_for does not modify its arguments when generating polymorphic URLs
1. number_to_currency and number_with_delimiter now accept a custom delimiter_pattern option to handle placement of delimiter, to support currency formats like INR. Example:
    ```
    number_to_currency(1230000, delimiter_pattern: /(\d+?)(?=(\d\d)+(\d)(?!\d))/, unit: '₹', format: "%u %n")
    # => '₹ 12,30,000.00'
    ```
1. 

















