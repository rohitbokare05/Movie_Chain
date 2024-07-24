from web3 import Web3
from web3.middleware import geth_poa_middleware
from web3.exceptions import ContractCustomError
from dotenv import load_dotenv
import os
from django.http import JsonResponse, HttpResponse

load_dotenv()
secret_key = os.getenv("PRIVATE_KEY")
account = os.getenv("ACCOUNT")
rpc_url = "https://polygon-amoy.infura.io/v3/b7353460d7df4f15ad8d360e0a3702e8"
web3 = Web3(Web3.HTTPProvider(rpc_url))

# Check connection
if web3.is_connected():
    print("Connected to the Ethereum network")
else:
    print("Could not connect to the Ethereum network")

# Inject middleware for compatibility
web3.middleware_onion.inject(geth_poa_middleware, layer=0)

# Contract details
contract_address = "0xa0628F8978192D652C1a6Be6f07264B3d6A7A992"
contract_abi = [
    {"type": "constructor", "inputs": [], "stateMutability": "nonpayable"},
    {"type": "receive", "stateMutability": "payable"},
    {
        "type": "function",
        "name": "CANCELLATION_TIME",
        "inputs": [],
        "outputs": [{"name": "", "type": "uint256", "internalType": "uint256"}],
        "stateMutability": "view",
    },
    {
        "type": "function",
        "name": "_owner",
        "inputs": [],
        "outputs": [{"name": "", "type": "address", "internalType": "address"}],
        "stateMutability": "view",
    },
    {
        "type": "function",
        "name": "buyTicket",
        "inputs": [{"name": "ticketId", "type": "uint256", "internalType": "uint256"}],
        "outputs": [],
        "stateMutability": "payable",
    },
    {
        "type": "function",
        "name": "cancelTicket",
        "inputs": [{"name": "ticketId", "type": "uint256", "internalType": "uint256"}],
        "outputs": [],
        "stateMutability": "nonpayable",
    },
    {
        "type": "function",
        "name": "getOwner",
        "inputs": [],
        "outputs": [{"name": "", "type": "address", "internalType": "address"}],
        "stateMutability": "view",
    },
    {
        "type": "function",
        "name": "getTickerPrice",
        "inputs": [{"name": "ticketId", "type": "uint256", "internalType": "uint256"}],
        "outputs": [{"name": "", "type": "uint256", "internalType": "uint256"}],
        "stateMutability": "view",
    },
    {
        "type": "function",
        "name": "getTicketBuyingTime",
        "inputs": [{"name": "ticketId", "type": "uint256", "internalType": "uint256"}],
        "outputs": [{"name": "", "type": "uint256", "internalType": "uint256"}],
        "stateMutability": "view",
    },
    {
        "type": "function",
        "name": "getTicketOwner",
        "inputs": [{"name": "ticketId", "type": "uint256", "internalType": "uint256"}],
        "outputs": [{"name": "", "type": "address", "internalType": "address"}],
        "stateMutability": "view",
    },
    {
        "type": "function",
        "name": "getTicketPrice",
        "inputs": [{"name": "ticketId", "type": "uint256", "internalType": "uint256"}],
        "outputs": [{"name": "", "type": "uint256", "internalType": "uint256"}],
        "stateMutability": "view",
    },
    {
        "type": "function",
        "name": "getTicketStatus",
        "inputs": [{"name": "ticketId", "type": "uint256", "internalType": "uint256"}],
        "outputs": [
            {"name": "", "type": "uint8", "internalType": "enum Manager.TicketStatus"}
        ],
        "stateMutability": "view",
    },
    {
        "type": "function",
        "name": "issueTicket",
        "inputs": [
            {"name": "_ticketId", "type": "uint256", "internalType": "uint256"},
            {"name": "_price", "type": "uint256", "internalType": "uint256"},
        ],
        "outputs": [],
        "stateMutability": "nonpayable",
    },
    {
        "type": "function",
        "name": "refundOnCancellation",
        "inputs": [
            {"name": "owner", "type": "address", "internalType": "address"},
            {"name": "ticketId", "type": "uint256", "internalType": "uint256"},
        ],
        "outputs": [],
        "stateMutability": "nonpayable",
    },
    {
        "type": "function",
        "name": "sellTicket",
        "inputs": [
            {"name": "ticketId", "type": "uint256", "internalType": "uint256"},
            {"name": "price", "type": "uint256", "internalType": "uint256"},
        ],
        "outputs": [],
        "stateMutability": "nonpayable",
    },
    {
        "type": "function",
        "name": "ticketIdToTicket",
        "inputs": [{"name": "", "type": "uint256", "internalType": "uint256"}],
        "outputs": [
            {"name": "ticketId", "type": "uint256", "internalType": "uint256"},
            {"name": "price", "type": "uint256", "internalType": "uint256"},
            {"name": "owner", "type": "address", "internalType": "address"},
            {"name": "buyingTime", "type": "uint256", "internalType": "uint256"},
            {
                "name": "status",
                "type": "uint8",
                "internalType": "enum Manager.TicketStatus",
            },
        ],
        "stateMutability": "view",
    },
    {
        "type": "event",
        "name": "TicketBought",
        "inputs": [
            {
                "name": "ticketId",
                "type": "uint256",
                "indexed": True,
                "internalType": "uint256",
            },
            {
                "name": "buyer",
                "type": "address",
                "indexed": True,
                "internalType": "address",
            },
        ],
        "anonymous": False,
    },
    {
        "type": "event",
        "name": "TicketCancelled",
        "inputs": [
            {
                "name": "ticketId",
                "type": "uint256",
                "indexed": True,
                "internalType": "uint256",
            }
        ],
        "anonymous": False,
    },
    {
        "type": "event",
        "name": "TicketForSale",
        "inputs": [
            {
                "name": "ticketId",
                "type": "uint256",
                "indexed": True,
                "internalType": "uint256",
            },
            {
                "name": "price",
                "type": "uint256",
                "indexed": True,
                "internalType": "uint256",
            },
        ],
        "anonymous": False,
    },
    {
        "type": "event",
        "name": "TicketIssued",
        "inputs": [
            {
                "name": "ticketId",
                "type": "uint256",
                "indexed": True,
                "internalType": "uint256",
            },
            {
                "name": "price",
                "type": "uint256",
                "indexed": True,
                "internalType": "uint256",
            },
        ],
        "anonymous": False,
    },
    {"type": "error", "name": "CancellationTimeExceeded", "inputs": []},
    {"type": "error", "name": "NotEnoughEther", "inputs": []},
    {"type": "error", "name": "SeatNotOwned", "inputs": []},
    {"type": "error", "name": "TicketNotAvailable", "inputs": []},
    {"type": "error", "name": "TransactionFailed", "inputs": []},
]
contract = web3.eth.contract(address=contract_address, abi=contract_abi)

# list_of_events = []


def get_contract_owner():
    try:
        owner = contract.functions.getOwner().call()
        return owner
    except Exception as e:
        print(f"Error getting contract owner: {e}")
        return None


def cancel_ticket(request):
    ticket_id = request.POST.get("ticket_id")
    user_address = request.POST.get("user_address")

    if not ticket_id or not user_address:
        return HttpResponse("Missing parameters", status=400)

    try:
        transaction = contract.functions.cancelTicket(ticket_id).buildTransaction(
            {
                "from": user_address,
                "nonce": web3.eth.getTransactionCount(user_address),
                "gas": 2000000,
                "gasPrice": web3.toWei("20", "gwei"),
            }
        )

        private_key = request.POST.get("private_key")
        signed_txn = web3.eth.account.sign_transaction(transaction, private_key)

        tx_hash = web3.eth.send_raw_transaction(signed_txn.rawTransaction)

        receipt = web3.eth.wait_for_transaction_receipt(tx_hash)

        if receipt.status == 1:
            return HttpResponse(
                f"Ticket cancelled successfully. Transaction hash: {tx_hash.hex()}"
            )
        else:
            return HttpResponse("Transaction failed", status=400)
    except Exception as e:
        return HttpResponse(f"Error: {str(e)}", status=500)


def contract_buy_ticket(ticket_id, account, private_key):
    try:
        # Prepare the transaction details
        transaction = {
            "from": account,
            "nonce": web3.eth.getTransactionCount(account),
            "gas": 2000000,  # Adjust as necessary
            "gasPrice": web3.toWei("50", "gwei"),
            "value": web3.toWei(
                "1", "ether"
            ),  # Adjust as necessary based on ticket price
        }

        tx = contract.functions.buyTicket(ticket_id).buildTransaction(transaction)
        signed_tx = web3.eth.account.sign_transaction(tx, private_key)
        tx_hash = web3.eth.send_raw_transaction(signed_tx.rawTransaction)
        tx_receipt = web3.eth.wait_for_transaction_receipt(tx_hash)

        if tx_receipt.status == 1:
            return f"Ticket bought successfully. Transaction hash: {tx_hash.hex()}"
        else:
            return "Transaction failed"
    except ContractCustomError as e:
        return f"Contract error while buying ticket: {str(e)}"
    except Exception as e:
        return f"Error buying ticket: {str(e)}"

        # Wait for the transaction receipt


def contract_issue_ticket(ticket_id, price):
    try:
        tx = {
            "chainId": 80002,
            "to": contract_address,
            "nonce": web3.eth.get_transaction_count(account),
            "gas": 2500000,
            "gasPrice": web3.to_wei("55", "gwei"),
            "data": contract.encodeABI(fn_name="issueTicket", args=[ticket_id, price]),
        }
        signed_tx = web3.eth.account.sign_transaction(tx, private_key=secret_key)
        tx_hash = web3.eth.send_raw_transaction(signed_tx.rawTransaction)

        # Optionally, wait for the transaction receipt
        tx_receipt = web3.eth.wait_for_transaction_receipt(tx_hash)

        print(f"Transaction hash: {tx_receipt.transactionHash.hex()}")
        # except Exception as e:
        #     print(f"Transaction failed: {e}")
        # return JsonResponse({"tx_hash": web3.toHex(tx_hash)})
        # tx_hash = contract.functions.issueTicket(int(ticket_id), int(price)).transact()
        # tx_receipt = web3.eth.wait_for_transaction_receipt(tx_hash)
        # return tx_receipt
    except ContractCustomError as e:
        print(f"Contract error while issuing ticket: {e}")
    # except Exception as e:
    #     print(f"Error issuing ticket: {e}")
    return None


def contract_sell_ticket(ticket_id, price):
    try:
        transaction = {
            "from": account,
            "nonce": web3.eth.get_transaction_count(account),
            "gas": 2000000,
            "gasPrice": web3.toWei("50", "gwei"),
        }
        tx_hash = contract.functions.sellTicket(ticket_id, int(price)).transact(
            transaction
        )
        tx_receipt = web3.eth.wait_for_transaction_receipt(tx_hash)
        return tx_receipt
    except ContractCustomError as e:
        print(f"Contract error while selling ticket: {e}")
    except Exception as e:
        print(f"Error selling ticket: {e}")
    return None
