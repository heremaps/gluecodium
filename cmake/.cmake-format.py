# --------------------------
# General Formatting Options
# --------------------------
# How wide to allow formatted cmake files
line_width = 100

# How many spaces to tab for indent
tab_size = 2

# If an argument group contains more than this many sub-groups (parg or kwarg
# groups), then force it to a vertical layout.
max_subgroups_hwrap = 3

# If a positional argument group contains more than this many arguments, then
# force it to a vertical layout.
max_pargs_hwrap = 6

# If true, separate flow control names from their parentheses with a space
separate_ctrl_name_with_space = False

# If true, separate function names from parentheses with a space
separate_fn_name_with_space = False

# If a statement is wrapped to more than one line, than dangle the closing
# parenthesis on its own line.
dangle_parens = False

# If the trailing parenthesis must be 'dangled' on its on line, then align it to
# this reference: `prefix`: the start of the statement,  `prefix-indent`: the
# start of the statement, plus one indentation  level, `child`: align to the
# column of the arguments
dangle_align = 'prefix'

# If the statement spelling length (including space and parenthesis) is smaller
# than this amount, then force reject nested layouts.
min_prefix_chars = 4

# If the statement spelling length (including space and parenthesis) is larger
# than the tab width by more than this amount, then force reject un-nested
# layouts.
max_prefix_chars = 10

# If a candidate layout is wrapped horizontally but it exceeds this many lines,
# then reject the layout.
max_lines_hwrap = 2

# What style line endings to use in the output.
line_ending = 'unix'

# Format command names consistently as 'lower' or 'upper' case
command_case = 'lower'

# Format keywords consistently as 'lower' or 'upper' case
keyword_case = 'upper'

# Specify structure for custom cmake functions
additional_commands = {
  'apigen_android_archive': {
    'kwargs': {
      'NAME': 1,
      'TARGET': 1,
      'ASSET': '*',
      'ASSETS': '*',
      'ADD_JAR': '*',
      'RESOURCES': '*'
    }
  },
  'apigen_generate': {
    'flags': ['VALIDATE_ONLY', 'VERBOSE', 'STUBS'],
    'kwargs': {
      'TARGET': 1,
      'GENERATOR': 1,
      'VERSION': 1,
      'ANDROID_MERGE_MANIFEST': 1,
      'JAVA_PACKAGE': 1,
      'JAVA_INTERNAL_PACKAGE': 1,
      'JAVA_NAMERULES': 1,
      'JAVA_NONNULL_ANNOTATION': 1,
      'JAVA_NULLABLE_ANNOTATION': 1,
      'COPYRIGHT_HEADER': 1,
      'CPP_INTERNAL_NAMESPACE': 1,
      'CPP_EXPORT': 1,
      'CPP_NAMERULES': 1,
      'SWIFT_NAMERULES': 1,
      'INTERNAL_PREFIX': 1,
      'OUTPUT_DIR': 1,
      'COMMON_OUTPUT_DIR': 1,
      'BUILD_OUTPUT_DIR': 1,
      'DART_LIBRARY_NAME': 1,
      'DART_FUNCTION_LOOKUP_ERROR_MESSAGE': 1,
      'DART_NAMERULES': 1,
      'LIME_SOURCES': '*',
      'FRANCA_SOURCES': '*',
      'WERROR': '*'
    }
  },
  'apigen_list_generated_sources': {
    'flags': ['MAIN', 'COMMON'],
    'kwargs': {
      'TARGET': 1,
      'GENERATOR': 1,
      'BUILD_OUTPUT_DIR': 1
    }
  },
  'apigen_packaging_find_shared_library_dependencies': {
    'pargs': 2,
    'flags': ['MAIN', 'COMMON'],
    'kwargs': {
      'TARGET': 1,
      'EXCLUDE_TARGETS': '*'
    }
  },
  'apigen_get_target_include_directories': {
    'pargs': 1,
    'flags': ['MAIN', 'COMMON'],
    'kwargs': {
      'PUBLIC_RESULT_VARIABLE': 1,
      'PRIVATE_RESULT_VARIABLE': 1
    }
  },
  'apigen_target_include_directories': {
    'pargs': 1,
    'flags': ['MAIN', 'COMMON']
  },
  'apigen_target_sources': {
    'pargs': 1,
    'flags': ['SKIP_SWIFT', 'MAIN', 'COMMON']
  },
  'apigen_java_compile': {
    'kwargs': {
      'TARGET': 1,
      'LOCAL_DEPENDENCIES': '*',
      'LOCAL_DEPENDENCIES_DIRS': '*',
      'LOCAL_JARS': '*',
      'REMOTE_DEPENDENCIES': '*',
      'LOCAL_SOURCES_DIRS': '*'
    }
  },
  'apigen_java_jar': {
    'pargs': 1,
    'kwargs': {
      'OUTPUT_DIR': 1
    }
  },
  'dokka_api_documentation': {
    'kwargs': {
      'TARGET': 1,
      'OUTPUT_DIR': 1,
      'INPUT_DIR': '*'
    }
  },
  'apigen_swift_build': {
    'pargs': 1,
    'kwargs': {
      'MODULEMAP_HEADERS': '*',
      'FRAMEWORKS': '*',
      'FRAMEWORK_DIRS': '*'
    }
  },
  'apigen_swift_compile': {
    'pargs': 2,
    'kwargs': {
      'FRAMEWORKS': '*',
      'FRAMEWORK_DIRS': '*'
    }
  },
  'apigen_swift_framework_bundle': {
    'kwargs': {
      'TARGET': 1,
      'BUNDLE_PATH': 1,
      'ASSET': '*',
      'ASSETS': '*'
    }
  },
  'apigen_swift_modulemap': {
    'pargs': 1,
    'kwargs': {
      'HEADERS': '*'
    }
  },
  'apigen_swift_test': {
    'pargs': 1,
    'kwargs': {
      'TEST_EXECUTABLE_NAME': 1,
      'SOURCES': '*'
    }
  },
  'apigen_create_package': {
    'kwargs': {
      'TARGET': 1,
      'NAME': 1,
      'SWIFT_FRAMEWORK_IDENTIFIER': 1,
      'EXTRA_SOURCE_DIR': '*',
      'ASSET': '*',
      'ASSETS': '*',
      'EXCLUDE_TARGETS': '*',
      'DEPENDS': '*',
      'ANDROID_JARS': '*',
      'ANDROID_LOCAL_DEPENDENCIES': '*',
      'ANDROID_LOCAL_DEPENDENCIES_DIRS': '*',
      'ANDROID_REMOTE_DEPENDENCIES': '*',
      'ANDROID_LIBRARY_LIST': '*',
    }
  },


  'test_assert_strequal': {
    'kwargs': {
      'EXPECTED': 1, 
      'MESSAGE': '*', 
      'ACTUAL': 1
    }
  },
  'test_assert_not_strequal': {
    'kwargs': {
      'EXPECTED': 1, 
      'MESSAGE': '*', 
      'ACTUAL': 1
    }
  },
  'test_expect_not_strequal': {
    'kwargs': {
      'EXPECTED': 1, 
      'MESSAGE': '*', 
      'ACTUAL': 1
    }
  },
  'test_assert_execute_process_succeed': {
    'flags': [
      'OUTPUT_QUIET',
      'ERROR_QUIET',
      'OUTPUT_STRIP_TRAILING_WHITESPACE',
      'ERROR_STRIP_TRAILING_WHITESPACE'
    ],
    'kwargs': {
      'MESSAGE': '*',
      'COMMAND': '*',
      'FATAL_ERROR_ON_FAIL': '*',
      'WORKING_DIRECTORY': 1,
      'TIMEOUT': 1,
      'RESULT_VARIABLE': 1,
      'RESULTS_VARIABLE': 1,
      'OUTPUT_VARIABLE': 1,
      'ERROR_VARIABLE': 1,
      'INPUT_FILE': 1,
      'OUTPUT_FILE': 1,
      'ERROR_FILE': 1,
      'COMMAND_ECHO': 1,
      'ENCODING': 1
    }
  },
  'test_assert_strequal_lists': {
    'kwargs': {
      'EXPECTED': '*', 
      'MESSAGE': '*', 
      'ACTUAL': '*'
    }
  },
  'test_expect_strequal': {
    'kwargs': {
      'EXPECTED': 1, 
      'MESSAGE': '*', 
      'ACTUAL': 1
    }
  },
  'test_assert_defined': {
    'kwargs': {
      'VARIABLE': 1, 
      'MESSAGE': '*'
    }
  }, 
  'test_assert_matches_regex': {
    'kwargs': {
      'EXPECTED': 1, 
      'MESSAGE': '*', 
      'ACTUAL': 1
    }
  }, 
  'test_expect_matches_regex': {
    'kwargs': {
      'EXPECTED': 1, 
      'MESSAGE': '*', 
      'ACTUAL': 1
    }
  }, 
  'test_assert_true': {
    'kwargs': {
      'VARIABLE': '*', 
      'MESSAGE': '*', 
      'CONDITION': 1
    }
  },
  'test_assert_false': {
    'kwargs': {
      'VARIABLE': '*', 
      'MESSAGE': '*', 
      'CONDITION': 1
    }
  }, 
  'test_expect_defined': {
    'kwargs': {
      'VARIABLE': 1, 
      'MESSAGE': '*'
    }
  }, 
  'message_colored': {
    'pargs': 2
  },
  'test_assert_not_defined': {
    'kwargs': {
      'VARIABLE': 1, 
      'MESSAGE': '*'
    }
  },
  'test_expect_false': {
    'kwargs': {
      'VARIABLE': '*', 
      'MESSAGE': '*', 
      'CONDITION': 1
    }
  },
  'test_expect_true': {
    'kwargs': {
      'VARIABLE': '*', 
      'MESSAGE': '*', 
      'CONDITION': 1
    }
  }, 
  'test_expect_strequal_lists': {
    'kwargs': {
      'EXPECTED': '*', 
      'MESSAGE': '*', 
      'ACTUAL': '*'
    }
  },
}

# A list of command names which should always be wrapped
always_wrap = []

# If true, the argument lists which are known to be sortable will be sorted
# lexicographicall
enable_sort = True

# If true, the parsers may infer whether or not an argument list is sortable
# (without annotation).
autosort = False

# By default, if cmake-format cannot successfully fit everything into the
# desired linewidth it will apply the last, most agressive attempt that it made.
# If this flag is True, however, cmake-format will print error, exit with non-
# zero status code, and write-out nothing
require_valid_layout = False

# A dictionary containing any per-command configuration overrides. Currently
# only `command_case` is supported.
per_command = {}

# A dictionary mapping layout nodes to a list of wrap decisions. See the
# documentation for more information.
layout_passes = {}

# ----------------------------
# Options affecting the linter
# ----------------------------
with section('linter'):
  # a list of lint codes to disable
  disabled_codes = []

  # regular expression pattern describing valid function names
  function_pattern = '[0-9a-z_]+'

  # regular expression pattern describing valid macro names
  macro_pattern = '[0-9A-Z_]+'

  # regular expression pattern describing valid names for variables with global
  # scope
  global_var_pattern = '[0-9A-Z][0-9A-Z_]+'

  internal_var_pattern = '_[0-9A-Z_]+'

  # regular expression pattern describing valid names for variables with local
  # scope
  local_var_pattern = '[0-9a-z][0-9a-z_]+'

  private_var_pattern = '_[0-9a-z_]+'

  public_var_pattern = '[0-9A-Z][0-9A-Z_]+'

  # regular expression pattern describing valid names for keywords used in
  # functions or macros
  keyword_pattern = '[0-9A-Z_]+'

  # In the heuristic for C0201, how many conditionals to match within a loop in
  # before considering the loop a parser.
  max_conditionals_custom_parser = 2

  # Require at least this many newlines between statements
  min_statement_spacing = 1

  # Require no more than this many newlines between statements
  max_statement_spacing = 1

  max_returns = 6

  max_branches = 12

  max_arguments = 5

  max_localvars = 15

  max_statements = 50

# ------------------------------------
# Options affecting comment formatting
# ------------------------------------
# What character to use for bulleted lists
bullet_char = '*'

# What character to use as punctuation after numerals in an enumerated list
enum_char = '.'

# If comment markup is enabled, don't reflow the first comment block in each
# listfile. Use this to preserve formatting of your copyright/license
# statements.
first_comment_is_literal = True

# If comment markup is enabled, don't reflow any comment block which matches
# this (regex) pattern. Default is `None` (disabled).
literal_comment_pattern = None

# Regular expression to match preformat fences in comments
# default=r'^\s*([`~]{3}[`~]*)(.*)$'
fence_pattern = '^\\s*([`~]{3}[`~]*)(.*)$'

# Regular expression to match rulers in comments
# default=r'^\s*[^\w\s]{3}.*[^\w\s]{3}$'
ruler_pattern = '^\\s*[^\\w\\s]{3}.*[^\\w\\s]{3}$'

# If a comment line starts with at least this many consecutive hash characters,
# then don't lstrip() them off. This allows for lazy hash rulers where the first
# hash char is not separated by space
hashruler_min_length = 10

# If true, then insert a space between the first hash char and remaining hash
# chars in a hash ruler, and normalize its length to fill the column
canonicalize_hashrulers = True

# enable comment markup parsing and reflow
enable_markup = True

# ---------------------
# Miscellaneous options
# ---------------------
# If true, emit the unicode byte-order mark (BOM) at the start of the file
emit_byteorder_mark = False

# Specify the encoding of the input file. Defaults to utf-8.
input_encoding = 'utf-8'

# Specify the encoding of the output file. Defaults to utf-8. Note that cmake
# only claims to support utf-8 so be careful when using anything else
output_encoding = 'utf-8'