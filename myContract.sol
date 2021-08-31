pragma solidity=0.6.6;



interface IUniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}
interface IUniswapV2Pair {
       function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);

}

interface IERC20 {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
}

interface IUniswap  {

       function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}
 
contract myContract {
    address owner;
    uint balance1;
    uint balance2;
    uint liquidityHave;
    address  uniswaprouteraddress = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address uniswapFactory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    IUniswap router = IUniswap(uniswaprouteraddress);
    IUniswapV2Factory factor = IUniswapV2Factory(uniswapFactory);
    uint public trialAllownace;
    uint public trialAllownace2;

    constructor() public {
     
        owner = msg.sender;
    }
    function getTokens() public{
   //     balance1 = token1.balanceOf(address(this));
     //   balance2 = token2.balanceOf(address(this));
    }


    function getTokA()
    public{
  //      require(token1.transferFrom(msg.sender,address(this),20),"failed toka");
    }
    function getTokB()
    public{
    //    require(token2.transferFrom(msg.sender,address(this),20),"failed tokb");
    }
   
   
    function swapTokforTok(uint amIn,uint amOutmin,address _tokenA,address _tokenB)
    public {
        IERC20(_tokenA).transferFrom(msg.sender, address(this), amIn);
    address[] memory path = new address[](2);
    path[0] = _tokenA;
    path[1] = _tokenB;
     IERC20(_tokenA).approve(address(router),amIn);
    router.swapExactTokensForTokens(amIn, amOutmin, path, msg.sender, (block.timestamp + 1 days));

    }   
    
     function swapTokforEth(
         uint amIn,
         uint amOutmin,
         address _tokenA)
    public {
        IERC20(_tokenA).transferFrom(msg.sender, address(this), amIn);
    address[] memory path = new address[](2);
    path[0] = _tokenA;
    path[1] = router.WETH();
     IERC20(_tokenA).approve(address(router),amIn);
    router.swapExactTokensForETH(amIn, amOutmin, path, msg.sender, block.timestamp);

    } 
    //     function swapExactTokensForETH(
    //     address _token,
    //     uint256 _amountIn,
    //     uint256 _amountOutMin,
    //     uint256 _deadline
    // ) external {
    //     IERC20(_token).transferFrom(msg.sender, address(this), _amountIn);
    //     address[] memory path = new address[](2);
    //     path[0] = _token;
    //     path[1] = router.WETH();
    //     IERC20(_token).approve(address(router), _amountIn);
    //     router.swapExactTokensForETH(_amountIn, _amountOutMin, path, msg.sender, _deadline);
    // }
    
    
    
    
    
    
    
    
    
    
     function swapEthforTok(uint amOutmin,address _tokenB)
    public  payable {
        address[] memory path = new address[](2);
    path[0] = router.WETH();
    path[1] = _tokenB;
    router.swapExactETHForTokens{value:msg.value}(amOutmin, path, msg.sender, (block.timestamp + 1 days));

    } 
    function addLiquidity(
        address _tokenA,
        address _tokenB,
        uint256 _amountADesired,
        uint256 _amountBDesired,
        uint256 _amountAMin,
        uint256 _amountBMin,
        address _to
    ) external {
        IERC20(_tokenA).transferFrom(msg.sender, address(this), _amountADesired);
        IERC20(_tokenB).transferFrom(msg.sender, address(this), _amountBDesired);
        IERC20(_tokenA).approve(address(router), _amountADesired);
        IERC20(_tokenB).approve(address(router), _amountBDesired);
        router.addLiquidity(_tokenA, _tokenB, _amountADesired, _amountBDesired, _amountAMin, _amountBMin, _to, block.timestamp);
    }

    function removeLiquidity(  address tokenA, 
 address tokenB,  
 uint liquidity,
    uint amountAMin,
     uint amountBMin,
        address to)
         external 
 {
    //pair contract
    address p = factor.getPair(tokenA, tokenB);
    //liquidity balance
    uint liqBalance = IUniswapV2Pair(p).balanceOf(to);
    require(liquidity<=liqBalance,"You dont have enough liquidity");
    //check if i externally allowed my contract to transfer  x liq from user to contract
    //give smart contract control and transfer liquidit to it
    require(IUniswapV2Pair(p).allowance(msg.sender,address(this))>=liquidity,"not yet approved");
    // after approving transfer from  metamask tocontract
    IUniswapV2Pair(p).transferFrom(msg.sender,address(this),liquidity);
// approve router of lp from token and router will transfer it to pair to burn them
    IUniswapV2Pair(p).approve(address(router),liquidity);
    router.removeLiquidity(tokenA,
        tokenB,
     liquidity,
         amountAMin,
         amountBMin,
         to,
        block.timestamp
        );
    }
}
