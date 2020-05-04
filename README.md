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

## Roadmap

This current implementation solves the problem for the requirements given in the
original spec but there are lots of opportunities for improvement.

A few ideas that could be implemented are:

###  Different output formats

Given the modular nature of the code, adding a new output format would look like
adding a new method in the `Formatter` class, eg. `to_json` and then this could
call the logic inside that new method or we could add a new object to handle it,
eg. `Formatter::JSON`.

The idea is that we follow the OO principle of "open to extension but closed to
modification".

Adding new output formats should be as simple as adding new objects to handle
the format and not require changing the existing classes.


### Persisting to a datastore

This current implementation is an in-memory solution but it is easy to imagine
an improvement being to store the results of the parsing in a datastore.

The choice of datastore would depend on the intended use of the data. Without
knowing that upfront, a pragmatic choice might be to use a key-value store such
as Redis. We could store the counts for keys that represent the different ways
we would like to retrieve the data.

For example, we might want to store the total and unique counts at different
keys, ie. `/about:unique`.

Alternatively, we might want to also introduce extra data about the date the
request occurred. We might use a Document based NoSQL data store, either
something like MongoDB or Google Firestore to store records based on the date
components. This would see us have documents for year, month, date and hour
for the unique and total values.

A SQL based datastore could also work and might be more appropriate if there
are particular strengths in the team with SQL.

In terms of how we could implement it. The `Parser` class could add a new step
to persist the count, and then we would create new classes from that to handle
the different steps, ie. connecting to the datastore, creating and executing
the query that stores it and handling errors.

### Automating Log Parsing

We might want to automate this process, so rather than running it manually,
a CRON job would fetch the log file, pass it to the script and then do
something with the output. eg. post the latest results to a Slack channel.

### Deploy as a webservice

With the availability of Function as a Service platforms like Amazon Lambda
or Now, we could modify the script to run when called by a request to a URL.

Both these services allow you to run Ruby in a small container and have a
low barrier to entry.

The modifications requried for the script to work there would be minimal.
Mostly they would be around how we handle getting the input log file as
we wouldn't be able to use the filesystem to retrieve it.
