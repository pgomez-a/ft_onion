# ft_onion
The goal of this project is to **create a web page and make it accessible from the Tor network by creating a hidden service.** To achieve this, I have used Docker to create a Linux environment and mount a server with Nginx. The goal is to connect to this server using Tor over HTTP and SSH.

Clone the repository:
    
    git clone https://github.com/pgomez-a/ft_onion.git ; cd ./ft_onion/
    
Run **docker build** to create the server image:
    
    docker build . -t onion_server
    
Run **docker run** to create the server container:
    
    docker run -d -p 8080:80 -p 2222:22 --name server onion_server
    
<br>Now you have your container up and running,. What we have done is set up an **Nginx server listening on port 80**, so that it can receive HTTP requests. We also have **SSH active on port 22** so we can connect to our server securely. We have configured Tor to access the server, so we need to know the addresses it has created to achieve those connections. To do this, run docker exec:

    docker exec -it server /bin/bash
    
To get Tor encrypted addresses, you need to type:

    # For HTTP
    cat /var/lib/tor/hidden_service/hostname

    # For SSH
    cat /var/lib/tor/other_hidden_service/hostname

### What is the Clear Web?
The **Clear Web** is the web we all know. It refers to information that can be accessed through any web browser, also known as the **World Wide Web**. By using the Clear Web, we are showing very important information about ourselves to the world. For example, every time we access a website with Google, we are showing our public IP address.<br>

> **World Wide Web:** worldwide computer network that works through the Internet and that allows the transmission of different types of data through the HTTP protocol.
> - **Hypertext:** text that contains links to other texts.
> - **HTTP:** Hypertext Transfer Protocol.

Broadly speaking, we can say that the Clear Web is the web where we can find all the **indexed pages** like Facebook. A page is said to be indexed when it is known by web search engines, so that we can access it through these search engines.


### What is the Deep Web?
The **Deep Web** is the opposite of the Clear Web. It refers to all that information that cannot be accessed through conventional web browsers. Here we can find all kinds of pages, such as dynamic websites that are temporarily created to search a database or paywalled sites. We are talking about **non-indexed pages**.<br><br>
For example, all the files you have in Google Drive are on the Internet. This content cannot be accessed because it is private. So we can say that our Google Drive files cannot be indexed, because they are on the internet but cannot be accessed by simple search. But one interesting thing about the Deep Web is that there are some pages that can be accessed, despite not being indexed. All the pages that belong to this category are part of the **Dark Web**.


### What is the Dark Web?
The **Dark Web** is made up of pages that are intentionally hidden from search engines. To achieve this, **masked IP addresses** are used and can only be accessed through special web browsers. The most common extensions for these addresses are **.onion** and **.i2p**.

> **.onion:** refers to an anonymous IP address that can be accessed through the Tor Network to become part of the Deep Web.

But the Dark Web is not a thing in itself, but the content that you can find in different **Dark Nets**, which are each one of the special networks that can only be accessed with special software. By their nature, **Dark Nets are often used by users to exchange illegal content or access illegal services.** All these pages have their own input method, but this does not mean that they cannot be indexed. The thing is that conventional web browsers cannot index them, but if they can be accessed with special software like Tor, they can also be indexed with other special software.<br>

<div align="center">

|····· CLEAR WEB ·····| ····· DEEP  WEB ·····|····· DARK  WEB ·····|
|:---------:|:--------:|:--------:|
|**4%**|**90%**|**6%**|
  
</div>

### What is TOR?
TOR, also known as **The Onion Router**, is the most well-known Dark Net on the Internet. Its main objective is to create a distributed network and superimposed on the Internet. The different Dark Webs that can be accessed through the Tor Dark Net are the ones with the .onion extension.<br>

The technique used by Tor is known as **Onion Routing**. The idea is to change the traditional Internet routing to ensure anonymity and data privacy. The traditional routing we use to browse the Internet is direct. This implies a direct connection between you and the server you want to connect to. The path goes from your machine to your ISP's routers, and from them to the server you want to visit. If someone sees the connection between you and the server, they will know exactly where the connection is coming from and where it is going. Even if you are using HTTPS, the headers are not encrypted, so the sender's and recipient's IPs will be seen.

To fix this we use Onion Routing. **This technique consists of sending the data packages through a non-direct path using different nodes**. The sender's machine establishes a random path of different nodes that the packages will follow. Then, it obtains the public keys of all the nodes that will be visited. In this way the packet is encrypted in layers. First, the package is encrypted with the public key of the last node. After this, the new encrypted package is encrypted with the key of the penultimate node. The process is repeated until the first node is reached and the package is encrypted. In this way, the package will go to the first node, be decrypted and go to the second node, and so on until the package reaches the last node. At this point, the last node's decryption will result in the original package. The receiver will not have to decrypt anything. Thanks to this method, no one can know where the package comes from or where the package is going.

- Because the package has to go through a non-direct routing path, **the lookup process is slower than with a conventional browser.**
- Each node will only know the IP of the previous node and the next node.
- **Our IP will only be known by the first node.** The server IP will only be known by the last node.
- Although the communication is much more secure, even with TOR our IP can be known. **Sometimes nodes are compromised and some people may have access to them.**
