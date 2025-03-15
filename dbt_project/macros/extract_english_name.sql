{% macro extract_english_name(tag_value) %}
    SUBSTR({{ tag_value }}::varchar, 4)
{% endmacro %}
