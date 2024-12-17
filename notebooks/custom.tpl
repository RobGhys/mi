{# Standalone template - no inheritance #}

{%- block header -%}
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ resources['metadata']['name'] }}</title>
    
    <style>
        /* Theme */
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
            line-height: 1.6;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        /* Navigation */
        .nav-container {
            background-color: #f8f9fa;
            padding: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .nav-container h1 {
            margin: 0 0 1rem 0;
            color: #333;
        }
        .nav-links {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }
        .nav-links a {
            text-decoration: none;
            color: #0366d6;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: background-color 0.2s;
        }
        .nav-links a:hover {
            background-color: #e1e4e8;
        }
        .nav-links a.active {
            background-color: #0366d6;
            color: white;
        }

        /* Notebook content */
        .notebook-content {
            padding: 2rem 0;
        }
        
        .cell {
            margin: 1rem 0;
        }
        
        .input_area pre {
            background-color: #f6f8fa;
            padding: 1rem;
            border-radius: 4px;
            overflow-x: auto;
        }
        
        .output_area pre {
            padding: 1rem;
            border-left: 3px solid #0366d6;
            background-color: #f8f9fa;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 1rem;
            background-color: #f8f9fa;
            margin-top: 2rem;
            font-size: 0.9rem;
            color: #666;
            border-top: 1px solid #e1e4e8;
        }
    </style>
</head>
{%- endblock header -%}

{%- block body -%}
<body>
    <div class="nav-container">
        <h1>Mechanistic Interpretability Tutorial</h1>
        <nav class="nav-links">
            <a href="../../docs/index.html">Home</a>
            <div class="nav-section">
                <a href="../1_maths/1_core_maths.html" {% if "1_core_maths" in resources['metadata']['name'] %}class="active"{% endif %}>Core Maths</a>
                <a href="../1_maths/2_advanced_maths.html" {% if "2_advanced_maths" in resources['metadata']['name'] %}class="active"{% endif %}>Advanced Maths</a>
                <a href="../1_maths/3_probas.html" {% if "3_probas" in resources['metadata']['name'] %}class="active"{% endif %}>Probability</a>
                <a href="../1_maths/4_calculus.html" {% if "4_calculus" in resources['metadata']['name'] %}class="active"{% endif %}>Calculus</a>
            </div>
            <div class="nav-section">
                <a href="../2_numpy/1_np_tuto.html" {% if "1_np_tuto" in resources['metadata']['name'] %}class="active"{% endif %}>NumPy</a>
            </div>
            <div class="nav-section">
                <a href="../3_nn/micrograd.html" {% if "micrograd" in resources['metadata']['name'] %}class="active"{% endif %}>Neural Networks</a>
            </div>
        </nav>
    </div>

    <div class="notebook-content">
    {% for cell in nb.cells %}
        <div class="cell {{ cell.cell_type }}_cell">
        {%- if cell.cell_type == 'code' -%}
            <div class="input_area">
                <pre>{{ cell.source }}</pre>
            </div>
            {%- if cell.outputs -%}
            <div class="output_area">
                {%- for output in cell.outputs -%}
                    {%- if output.output_type == 'stream' -%}
                        <pre>{{ output.text }}</pre>
                    {%- elif output.output_type == 'error' -%}
                        <pre style="color: red;">{{ output.ename }}: {{ output.evalue }}</pre>
                    {%- elif output.output_type == 'execute_result' -%}
                        {%- if 'text/plain' in output.data -%}
                            <pre>{{ output.data['text/plain'] }}</pre>
                        {%- endif -%}
                    {%- endif -%}
                {%- endfor -%}
            </div>
            {%- endif -%}
        {%- elif cell.cell_type == 'markdown' -%}
            {{ cell.source | markdown2html | safe }}
        {%- endif -%}
        </div>
    {% endfor %}
    </div>

    <footer class="footer">
        <p>© 2024 Robin Ghyselinck. All Rights Reserved. Any use, reproduction, or distribution of this material without express written permission from the copyright owner is strictly prohibited.</p>
    </footer>
</body>
</html>
{%- endblock body -%}