# Parser: A Smart Pension Code Test

This project is a code test for Smart Pension. The goal is to demonstrate good
programming practices, architecture and clear communication in code and the
supporting documentation.

### Getting Started

There are 2 steps to get started. Firstly, you need to setup the project and
all it's dependencies. We've made this a one step process:

```bash
bin/setup
```

Once that has completed you can go ahead and run the script like this:

```bash
./parser.rb logs/webserver.log
```

If you want to provide a different log file simply change the argument to
the relative path of the log file you wish to parse.

## Contributing

We welcome contributions to the project. In order to keep the project consistent
we follow some guidelines that allow us to avoid disagreements over code style
and formatting. This means we get to focus on discussing things that have a
more tangible impact on the project.

### Code Formatting

We're big fans of [Rubocop](https://rubocop.org) and use it here. For a longer explanation of why,
check out this post on [using a Ruby style guide](https://medium.com/@felixclack/how-can-a-ruby-style-guide-help-you-write-better-code-c07a0f798e73).

### Workflow

We practice [GitHub flow](https://guides.github.com/introduction/flow/index.html),
so remember to follow these steps:

1. Create a feature branch to work on. Name it for humans to read (eg. refactor-authentication).
2. Push to GitHub and open a pull request, being sure to keep in line with
   our [commits and PR messages guide](https://medium.com/@felixclack/writing-great-commit-messages-for-better-code-review-70b21dac5788).
3. Ensure all tests are passing and you have maintained our code coverage. If
   for reason you can't, please describe this in your commit message.
4. Use @mentions in the PR to notify the team and ask for review. Be sure to
   help or review others while you are waiting.
5. Once you have received approval, merge to master and deploy to staging.
