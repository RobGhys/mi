{% extends 'classic/index.html.j2' %}

{% block header %}
<head>
    {# Original nbconvert header with MathJax and other essentials #}
    {{ super() }}
    
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

        /* Content styling improvements */
        .jp-Notebook {
            padding: 2rem 0;
        }
        
        .jp-Cell {
            margin: 1rem 0;
        }
        
        .jp-InputArea-editor {
            background-color: #f6f8fa;
            padding: 1rem;
            border-radius: 4px;
            font-family: monospace;
        }
        
        .jp-OutputArea-output {
            padding: 1rem;
            border-left: 3px solid #0366d6;
            background-color: #f8f9fa;
        }

        .jp-MarkdownCell {
            padding: 1rem 0;
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
{% endblock header %}

{% block body_header %}
<body>
    <div class="nav-container">
        <h1>Mechanistic Interpretability Tutorial</h1>
        <nav class="nav-links">
            <a href="../../docs/">Home</a>
        </nav>
    </div>
{% endblock body_header %}

{% block body_footer %}
    <footer class="footer">
        <p>© 2024 Robin Ghyselinck. All Rights Reserved. Any use, reproduction, or distribution of this material without express written permission from the copyright owner is strictly prohibited.</p>
    </footer>
</body>
{% endblock body_footer %}