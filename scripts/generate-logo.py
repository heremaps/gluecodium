#!/usr/bin/env python3
"""
This script will run Gluecodium with the HelloWorld example and generate the background for the logo.
"""

import subprocess
import tempfile
import os
import sys
import xml.etree.ElementTree as ET
from collections import namedtuple

script_dir = os.path.dirname(os.path.realpath(__file__))
project_root = f'{script_dir}/../'
logo_dir = f'{project_root}/docs/'
temp_dir = tempfile.mkdtemp(suffix=None, prefix=None, dir=None)

logo_in = f'{logo_dir}/logo-in.svg'
logo_out = f'{logo_dir}/logo.svg'

# generate the content
subprocess.run([f'{project_root}/generate',
    f'-input {project_root}/examples/libhello/lime/hello/HelloWorld.lime',
    f'-output {temp_dir}/code',
    '-generators cpp,android,swift'],
    check=True)

# generate highlighted SVGs
try:
    subprocess.run(['highlight',
        '--batch-recursive=*HelloWorld*',
        '--out-format=svg',
        '--style=neon',
        '--include-style',
        '--style-outfile=code-style.css'],
        cwd=temp_dir,
        check=True)
except FileNotFoundError:
    print('Running `highlight` failed. You probably need to install it via `apt-get install highlight`', file=sys.stderr)
    exit(1)

# merge as background with main logo
Svg = namedtuple('Svg', 'filename x y')
code_snippets = [
    Svg('HelloWorld.h.svg', -100, 400),
    Svg('cbridge_HelloWorld.cpp.svg', -50, 0),
    Svg('com_example_hello_HelloWorld.h.svg', 0, 400),
    Svg('HelloWorld.java.svg', 0, 600),
    Svg('com_example_hello_HelloWorld.cpp.svg', 600, -100),
    Svg('cbridge_HelloWorld.h.svg', 200, 500),
    Svg('com_example_hello_HelloWorld__Conversion.cpp.svg', 400, 300),
    Svg('com_example_hello_HelloWorld__Conversion.h.svg', 1200, 300),
    Svg('HelloWorld.cpp.svg', 300, 1000),
    Svg('HelloWorld.swift.svg', 700, 700),
    ]

# preserve namespaces since these might be used inside strings
namespaces = [node for _, node in ET.iterparse(logo_in, events=['start-ns'])]
for (name, url) in namespaces:
    ET.register_namespace(name, url)

tree = ET.parse(logo_in)
root = tree.getroot()
background_layer = root.find('.//{http://www.w3.org/2000/svg}svg[@id="background"]')

for code_snippet in code_snippets:
    svg = ET.parse(f'{temp_dir}/{code_snippet.filename}').getroot()
    svg.attrib['x'] = f'{code_snippet.x}'
    svg.attrib['y'] = f'{code_snippet.y}'
    background_layer.append(svg)

tree.write(logo_out)
