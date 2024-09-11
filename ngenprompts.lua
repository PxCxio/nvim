return {
    Generate = { prompt = "$input", replace = true },
    Chat = { prompt = "$input" },
    Summarize = { prompt = "Summarize the following text:\n$text" },
    Ask = { prompt = "Regarding the following text, $input:\n$text" },
    Change = {
        prompt = "Change the following text, $input, just output the final text without additional quotes around it:\n$text",
        replace = true,
    },
    Enhance_Grammar_Spelling = {
        prompt = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it:\n$text",
        replace = true,
    },
    Enhance_Wording = {
        prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it:\n$text",
        replace = true,
    },
    Make_Concise = {
        prompt = "Modify the following text to make it as simple and concise as possible, just output the final text without additional quotes around it:\n$text",
        replace = true,
    },
    Make_List = {
        prompt = "Render the following text as a markdown list:\n$text",
        replace = true,
    },
    Make_Table = {
        prompt = "Render the following text as a markdown table:\n$text",
        replace = true,
    },
    Review_Code = {
        prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
    },
    Enhance_Code = {
        prompt = "Enhance the following code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        replace = true,
        extract = "```$filetype\n(.-)```",
    },
	Optimize_Code = {
    prompt = [[
        Optimize the following code.

        Code:
        ```$filetype
        $text
        ```

        Optimized version:
        ```$filetype
    ]],
    replace = false,
    extract = "Optimized version:\n(.-)$"
	},
	Add_Tests = {
	    prompt = "Implement tests for the following code. Only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    	replace = false,
    	extract = "```$filetype\n(.-)```"
	},
	Complete_Code = {
        prompt = "Complete the following code written by pasting the existing code and continuing it.\n\nExisting code:\n```$filetype\n$text\n```",
        replace = true,
        extract = "```$filetype\n(.-)```"
    },
	Fix_Bugs = {
		prompt = "Fix bugs in the below code\n\nCode:\n```$filetype\n$text\n```\n\n",
    	replace = true,
    	extract = "```$filetype\n(.*)$"
	},
	Fix_Code = {
		  prompt = "Fix the following code. Only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
		  replace = true,
		  extract = "```$filetype\n(.-)```"
	},
	Translate = {
    prompt = [[
        Translate this into ```$input```:

        ```$text```
    ]],
    replace = false,
    extract = "Translated text: (.-)$"  -- Adjusted extract pattern
},
	Add_Docstring = {
		prompt = " # An elaborate, high quality docstring for the above function: \n # Writing a good docstring \n This is an example of writing a really good docstring that follows a best practice for the given language. Attention is paid to detailing things like \n * parameter and return types (if applicable) \n * any errors that might be raised or returned, depending on the language \n I received the following code: \n \n ```$filetype \n$text```",
    	replace = true,
    	extract = "```$filetype\n(.-)```"

	},
	Explain_Code = {
		prompt = [[
		Explain the following code:
		
		Code:
		```$filetype
		$text
		Use markdown format.
		Here's what the above code is doing:
		]],
		replace = false,
		extract = "Here's what the above code is doing:\n(.-)$"
	},
	Keywords = {
    prompt = [[
        Extract the main keywords from the following text.

        $text
    ]],
    replace = false,
    extract = "Keywords: (.-)$"
	},
	Roxygen_Edit = {
    prompt = [[
        Insert a roxygen skeleton to document this R function:

        ```$filetype
        [insert]

        $text
        ```
    ]],
    replace = false,
    extract = "Roxygen skeleton:\n(.-)$"  -- Adjusted extract pattern
	},
	Code_Readability_Analysis = {
    prompt = [[
        You must identify any readability issues in the code snippet.
        Some readability issues to consider:
        - Unclear naming
        - Unclear purpose
        - Redundant or obvious comments
        - Lack of comments
        - Long or complex one liners
        - Too much nesting
        - Long variable names
        - Inconsistent naming and code style.
        - Code repetition
        You may identify additional problems. The user submits a small section of code from a larger file.
        Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>
        Your commentary must fit on a single line
        Do not use the range of lines but just single line number
        If there's no issues with code respond with only: <OK>

        Code:
        ```$filetype
        $text
        ```
    ]],
    replace = false,
    extract = "<line_num>|<issue and proposed solution>"
	},
    Change_Code = {
        prompt = "Regarding the following code, $input, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        replace = true,
        extract = "```$filetype\n(.-)```",
    },
}
