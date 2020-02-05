# Start from a core stack version
FROM {{ cookiecutter.jupyter_notebook }}
# Install in the default python3 environment

{% if cookiecutter.uses_r.lower() not in ["n", "n", "false", "no", "0", "f"] %}
ADD install_r_packages_from_requirements.sh r_requirements.txt /tmp/
RUN cd /temp && \
    chmod +x /tmp/install_r_packages_from_requirements.sh && \
    /tmp/install_r_packages_from_requirements.sh && \
    rm -rf /tmp/install_r_packages_from_requirements.sh requirements.txt
{% endif %}

{% if cookiecutter.uses_python.lower() not in ["n", "n", "false", "no", "0", "f"] %}
ADD requirements.txt /tmp/
RUN cd /tmp && \
    pip install -r requirements.txt {% if cookiecutter.python_index_url != "None" %} --index-url {{ cookiecutter.python_index_url }} {% endif %}
{% endif %}