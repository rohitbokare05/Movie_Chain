document.addEventListener("DOMContentLoaded", () => {
    const connectButton = document.getElementById("connectButton");

    connectButton.addEventListener("click", async () => {
        if (window.ethereum) {
            try {
                const accounts = await window.ethereum.request({
                    method: "eth_requestAccounts",
                });
                const account = accounts[0];

                const message =
                    "Please sign this message to authenticate: " +
                    new Date().toISOString();
                const signature = await window.ethereum.request({
                    method: "personal_sign",
                    params: [message, account],
                });

                const response = await fetch("/authenticate/", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        address: account,
                        signature: signature,
                        message: message,
                    }),
                });

                const result = await response.json();
                if (result.status === "success") {
                    console.log("Authenticated:", result.address);
                } else {
                    console.error("Authentication failed:", result.message);
                }
            } catch (error) {
                console.error("Error:", error);
            }
        } else {
            console.error("MetaMask not installed");
        }
    });
});
