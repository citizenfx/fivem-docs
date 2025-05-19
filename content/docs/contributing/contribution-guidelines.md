---
title: Contribution Guidelines
---

## We welcome contributions!

This guide is here to help you understand the process, meet the expectations for style and formatting, and ensure your edits are reviewed and approved smoothly.

## How to Contribute

You can use the [Markdown Guide](https://www.markdownguide.org/basic-syntax/) to gain an understanding of Markdown and its principles.

You can contribute to the documentation in one of two ways, depending on how you'd like to work:

### Edit directly on GitHub

For small fixes or quick edits, you can use GitHub's in-browser editor.<br/>
Simply navigate to the file you want to change and click the pencil icon.<br/>
For guidance, see [GitHub's help page on editing files](https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files).

### Fork the repository and submit a pull request

1. Fork the [fivem-docs repository](https://github.com/citizenfx/fivem-docs.git) by clicking the "Fork" button in the top right corner.
2. Clone your fork to your local machine using a Git client or the command line. For example, you can use `git clone https://github.com/your-username/fivem-docs.git`, replacing your-username with your GitHub username.
3. Make your changes locally in the cloned repository.
4. Push your changes to your fork on GitHub. Make sure to commit your changes first, then push them to a branch in your fork.
5. Open a pull request from your fork to the main fivem-docs repository. Be sure to fill out the pull request template with the necessary information.
6. Wait for your pull request to be reviewed.

## Contribution Guidelines

- **Write Clear and Concise Documentation**: Aim to be as clear and concise as possible. Documentation should be accessible to both beginners and experienced developers.
- **Keep It Up-to-Date**: Ensure that the information you're adding or modifying is current. If you're making changes to outdated information, make sure to verify the facts before submitting your PR.
- **Provide Context**: Whenever applicable, include context, such as code examples or explanations of complex terms. You should cross-reference other parts of the documentation if relevant.
- **Respect Others' Work**: Be respectful of existing content. If you are editing someone else's work, please take care to preserve the original intent and style.
- **Link to Issues**: If your changes address a specific issue, reference it in the PR name using GitHub issue references (e.g., `Fixes #123`).
- **Keep It Professional**: Limit the use of emojis to avoid distracting elements.

## Styling Guidelines

### General Formatting

#### Headings

Use Markdown headers to organize your content:
- Use [Frontmatter](https://dev.to/dailydevtips1/what-exactly-is-frontmatter-123g) for page titles.
- Use `##` for section headers and `###` for subsections and so on.
- Ensure headers are descriptive and meaningful.

Example:

✅ `## Installing FiveM`<br/>
❌ `## Miscellaneous / First Step`

#### Lists

- Use bullet points (like - or *) for unordered lists, such as:<br/> 
  - Examples
  - Notes
  - Options or unordered items

- Use numbered lists (e.g., 1., 2., etc.) for ordered content, including:
  1. Step-by-step instructions
  2. Processes where order matters
  3. Ranked lists or priorities

#### Alert Boxes

Use alert boxes to highlight important information.

Examples:
```md
{{%/* alert title="Primary alert" theme="primary" */%}}A simple primary alert{{%/* /alert */%}}
{{%/* alert title="Secondary alert" theme="success" */%}}A simple secondary alert{{%/* /alert */%}}
{{%/* alert title="Warning alert" theme="warning" */%}}A simple warning alert{{%/* /alert */%}}
{{%/* alert title="Danger alert" theme="danger" */%}}A simple danger alert{{%/* /alert */%}}
```

#### Links

Limit the use of external links whenever possible.<br/>
When external links are necessary, ensure they are likely to remain available long-term.
Do not add links to images, see "Images and Diagrams" for more information on how to add them inside our documentation repository.

Use `[text](URL)` for clickable links.<br/>
Example: `[FiveM Docs](https://docs.fivem.net)`

Do not use shorthand links such as `<https://example.com>`.

Sibling URLs require to go to the parent path using `../` even though the corresponding files are located in the same directory.

#### Referencing Game Natives

If you a referencing a native, link to it like this:

`{{%/* native_link "NAME_OF_NATIVE" */%}}`

Example: `{{%/* native_link "IS_MODEL_A_VEHICLE" */%}}`<br/>
Will render as: {{% native_link "IS_MODEL_A_VEHICLE" %}}

#### Code Example Formatting

Use backticks (` `` `) for inline code.<br/>
Example: `` `git clone https://github.com/citizenfx/fivem.git` ``<br/>

Use triple backticks (`` ``` ``) to create code blocks for larger examples and specify the appropriate language.<br/>
Example:<br/>
````
```lua
-- Client-side script

function sayHello()
    print("Hello, World!")
end

-- Call the function
sayHello()
```
````

Specify the language for syntax highlighting (e.g., `bash`, `lua`, `json`).<br/>
Use proper indentation and consistent spacing (avoid mixing tabs and spaces).<br/>
Add brief context or explanation before/after the code when needed.<br/>
Provide consistent examples in Lua(default), JavaScript and C# if applicable.<br/>

#### Tone and Voice

This guide aims to keep docs clear, consistent, and easy to follow for all users, especially beginners.

**Audience**: Write with the assumption that the reader may be new to FiveM or game server modding. Keep explanations simple and understandable.

**Consistency**: Ensure consistent terminology and formatting across all documentation. This helps maintain a uniform tone and clarity.

**Imperative Tone**: Use the imperative mood (e.g., "*Install the dependencies*") rather than passive (e.g., "*The dependencies should be installed*").

#### Grammar and Spelling

**Spell Check**: Please ensure that your contributions are free of typos and grammatical errors. 

**Consistency in Spelling**: Choose American English spelling (e.g., "*color*" instead of "*colour*").

**Punctuation**: Ensure proper punctuation in all documentation. This includes commas, periods, and other punctuation marks at the end of sentences.

#### Images and Diagrams

You can upload images and diagrams to the `/static/` directory.
To include them in your documentation, use the following Markdown syntax:

`![Alt Text](/static/image.png)`

In `![Alt Text](/static/image.png)`, the "*Alt Text*" is the alt text.<br/>
This is a short description of the image that is displayed if the image can't be shown.
Replace "*Alt Text*" with a brief description relevant to the image (e.g., "*Server Console Output*" or "*Example Vehicle Spawn Menu*").

##### Image Format

- Use .webp for images whenever possible for optimal performance.
- If WebP is not feasible, use .png as an alternative.
- For short animations, use .gif.

Ensure all screenshots and visuals are clear, cropped, and properly labeled.

##### File Naming

For Guides and Articles:

- Use lowercase letters only.
- Use hyphens (-) to separate words.
- Use file extensions like .png or .webp.

Examples:

`install-guide.png`<br/>
`how-to-mod-vehicles.webp`

This style is case-sensitive - **always** use lowercase with exceptions below.

For Game References (e.g., ped models, vehicles, weapons):

- Use the exact name of the in-game entry.
- Maintain original casing, including uppercase letters, underscores, or numbers.
- Do not change to lowercase or add hyphens.

Examples:

`adder.webp`<br/>
`WEAPON_GRENADELAUNCHER_SMOKE.png`<br/>
`csb_trafficwarden.png`

This format is also case-sensitive - match the game's naming exactly.

Image Placement: Place images and diagrams within the body of the text where they are referenced.<br/>
Use Markdown syntax to display images:

Example:

`![Screenshot of the FiveM client](/contributing/fivem_logo_background.png)`

Will render as:

<!-- using img tag to not occupy the whole page size -->
<img src="/contributing/fivem_logo_background.png" alt="Screenshot of the FiveM client" width="200"/>

## Usage of AI

The use of AI tools is permitted strictly for spelling, grammar, and clarity improvements. Full content generation, including writing complete articles or guides using AI, is not allowed.

## Additional Resources

[FiveM Docs](https://docs.fivem.net)<br/>
[Markdown Guide](https://www.markdownguide.org/basic-syntax/)<br/>
[GitHub Editing files](https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files)

---

Thank you for contributing! ❤️
