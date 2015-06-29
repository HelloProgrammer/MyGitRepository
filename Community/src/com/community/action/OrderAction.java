package com.community.action;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.springframework.stereotype.Controller;

import com.community.model.Customer;
import com.community.model.Good;
import com.community.model.Order;
import com.community.model.OrderGood;
import com.community.model.OrderState;
import com.community.model.Warehouse;
import com.community.service.CustomerService;
import com.community.service.GoodService;
import com.community.service.OrderGoodService;
import com.community.service.OrderService;

import com.community.service.WarehouseService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("orderAction")
public class OrderAction extends ActionSupport{
	//service
	private OrderService orderService;
	private WarehouseService warehouseService;
	private CustomerService customerService;
	private GoodService goodService;
	private OrderGoodService orderGoodService;
	
	//model
	private Order order;	
	private Customer customer;
	private OrderState orderstate;
	private OrderGood ordergood;
	private Good good;
	
	//list
	private List<Order> orderlist;
	private List<Warehouse> warelist;
	
	private List<Customer> customerList;//绑定list
	private List<OrderState> orderStateList;//绑定list
	private List<OrderGood> ordergoodList;
	private List<Good> goodList;
	private List<List<OrderGood>> ordergoodListList;
	private List<List<Good>> goodListList;
	//string
	private String result;//json数据
	private String warehouseId;
	private String startTime = "";
	private String endTime = "";
	private String STATE;
	
	private static final String STATE_UNSOLVE ="1";
	private static final String STATE_ACCEPT = "2";
	private static final String STATE_REFUSE = "3";
	private static final String STATE_FINISH = "4";
	
	String orderStateId;
	private int orderGoodId;
	
	public String comment()
	{
		OrderGood orderGood = orderGoodService.getOrderGoodByOrderGoodId(ordergood.getId());
		if(orderGood.getCommentState().equals("未评论"))
		{
			ordergood = orderGoodService.getOrderGoodByOrderGoodId(ordergood.getId());
			return "add comment";
		}else{
			ordergood = orderGoodService.getOrderGoodByOrderGoodId(ordergood.getId());
			return "comment";
		}
		
	}
	
	public String addComment()
	{
		ordergood.setCommentState("已评价");
		orderGoodService.updateOrderGood(ordergood);
		return "update comment";
	}
	
	
	public String getAllOrder()
	{
			
		orderlist = orderService.getAllOrder();		
		List<Customer> customerListtmp = new ArrayList<Customer>();
		List<OrderState> orderStateLittmp = new ArrayList<OrderState>();
		
		for(int i=0;i<orderlist.size();i++)
		{			
			Customer c = customerService.getOneCustomer(orderlist.get(i).getCustomer());			
			OrderState o = orderService.getOneOrderState(orderlist.get(i).getOrderState());
			
			customerListtmp.add(c);
			orderStateLittmp.add(o);	
		}
		
		this.setCustomerList(customerListtmp);
		//System.out.println("这总行了吧");
		this.setOrderStateList(orderStateLittmp);
		return "getAll success";
	}
	
	public String getAllOrderByTime() {
		if (startTime.equals("") || endTime.equals("")) {
			if (STATE.equals("1")) {
				orderlist = orderService.getOrderByState(STATE_UNSOLVE);
				bindFun(orderlist);
			} 
			if (STATE.equals("2")) {
				orderlist = orderService.getOrderByState(STATE_ACCEPT);
				bindFun(orderlist);
			} 
			if (STATE.equals("3")) {
				orderlist = orderService.getOrderByState(STATE_REFUSE);
				bindFun(orderlist);
			} 
			if (STATE.equals("4")) {
				orderlist = orderService.getOrderByState(STATE_FINISH);
				bindFun(orderlist);
			}
		} else {
			if (STATE.equals("1")) {
				orderlist = orderService.getAllOrderByTime(startTime, endTime, STATE_UNSOLVE);
				bindFun(orderlist);
			} 
			if (STATE.equals("2")) {
				orderlist = orderService.getAllOrderByTime(startTime, endTime, STATE_ACCEPT);
				bindFun(orderlist);
			} 
			if (STATE.equals("3")) {
				orderlist = orderService.getAllOrderByTime(startTime, endTime, STATE_REFUSE);
				bindFun(orderlist);
			} 
			if (STATE.equals("4")) {
				orderlist = orderService.getAllOrderByTime(startTime, endTime, STATE_FINISH);
				bindFun(orderlist);
			}
		}
		
		return "getAllT success";
	}
	
	public String getUnsolveOrder()
	{
		orderlist = orderService.getOrderByState(STATE_UNSOLVE);
			
		bindFun(orderlist);
		
		return "get order by state";
	}
	public String getAcceptOrder()
	{
		orderlist = orderService.getOrderByState(STATE_ACCEPT);
			
		bindFun(orderlist);
		return "get order by state";
	}
	public String getRefuseOrder()
	{
		orderlist = orderService.getOrderByState(STATE_REFUSE);
			
		bindFun(orderlist);
		return "get order by state";
	}
	public String getFinishOrder()
	{
		orderlist = orderService.getOrderByState(STATE_FINISH);
			
		bindFun(orderlist);
		return "get order by state";
	}
	public void bindFun(List<Order> orderlist)
	
	{
		List<Customer> customerListtmp = new ArrayList<Customer>();
		List<OrderState> orderStateLittmp = new ArrayList<OrderState>();
		
		for(int i=0;i<orderlist.size();i++)
		{			
			Customer c = customerService.getOneCustomer(orderlist.get(i).getCustomer());			
			OrderState o = orderService.getOneOrderState(orderlist.get(i).getOrderState());
			
			customerListtmp.add(c);
			orderStateLittmp.add(o);	
		}
		
		this.setCustomerList(customerListtmp);
		//System.out.println("这总行了吧");
		this.setOrderStateList(orderStateLittmp);
	}
	
	
	public String listWarehouse()
	{		
		//System.out.println("进入list方法");
		warelist = warehouseService.getAllWarehouse();		
		JSONArray jsonArray = new JSONArray();		
		for(Iterator iterator = warelist.iterator();iterator.hasNext();)
		{			
			Warehouse warehouse = (Warehouse)iterator.next();			
			JSONObject jsonObject = new JSONObject();			
			jsonObject.put("warehouseId",warehouse.getWarehouseId());			
			jsonObject.put("name",warehouse.getName());
			jsonArray.add(jsonObject);		
		}	
		result = jsonArray.toString();	
		//System.out.println("list方法结束");
		return "list success";
	}
	public String OrderDetails()
	{
		order = orderService.getOneOrder(order.getOrderId());
		Customer c = customerService.getOneCustomer(order.getCustomer());	
		OrderState o = orderService.getOneOrderState(order.getOrderState());
		
		//System.out.println("方法钱");
		this.setOrdergoodList(orderService.getGoodByOrderId(order));
		List<Good> goodlisttmp = new ArrayList<Good>();
		for(int i=0;i<ordergoodList.size();i++)
		{
			Good g = goodService.getOneGood(ordergoodList.get(i).getGood().getGoodId());   
			goodlisttmp.add(g);
			System.out.print(g.getName());
			System.out.println(g.getGoodId());
		}
		
		
		this.setCustomer(c);
		this.setOrderstate(o);
		this.setGoodList(goodlisttmp);
		return "detail";
	}
	
	
	
	public String UpdateOrder()
	{
		Order order1 = orderService.getOneOrder(order.getOrderId());
		order1.setOrderState(new OrderState("4"));
		order1.setLogisticsStateId("已收货");
		orderService.updateOrder(order1);
		
		return "update";
	}
	
	
	
	public String FrontOrderDetails()
	{
		
		order = orderService.getOneOrder(order.getOrderId());
		orderStateId = order.getOrderState().getOrderStateId();
		Customer c = customerService.getOneCustomer(order.getCustomer());	
		OrderState o = orderService.getOneOrderState(order.getOrderState());
		
		//System.out.println("方法钱");
		this.setOrdergoodList(orderService.getGoodByOrderId(order));
		List<Good> goodlisttmp = new ArrayList<Good>();
		for(int i=0;i<ordergoodList.size();i++)
		{
			Good g = goodService.getOneGood(ordergoodList.get(i).getGood().getGoodId());   
			goodlisttmp.add(g);
			//System.out.print(g.getName());
			//System.out.println(g.getGoodId());
		}
		
		
		this.setCustomer(c);
		this.setOrderstate(o);
		this.setGoodList(goodlisttmp);
		
		return "front detail";
	}
	
	public String acceptOrder()
	{
		String warehouseId = order.getWarehouse().getWarehouseId();
		//System.out.println("进入update方法");
		order = orderService.getOneOrder(order.getOrderId());
		//System.out.println("查找方法");
		
		OrderState orderstatetmp = new OrderState();
		orderstatetmp.setOrderStateId("2");//接单状态
		//System.out.println("set方法");
		order.setOrderState(orderstatetmp);
		
		order.setWarehouse(new Warehouse(warehouseId));
		order.setLogisticsStateId("未发货");
		//System.out.println("set方法结束");
		orderService.updateOrder(order);
		//System.out.println("update方法结束");
		return "accept success";
	}
	
	public String findOneWarehouse()
	{
		Warehouse warehouse = warehouseService.findWarehouse(new Warehouse(warehouseId)).get(0);
		JSONObject jsonObject = new JSONObject();			
		jsonObject.put("warehouseId",warehouse.getWarehouseId());			
		jsonObject.put("name",warehouse.getName());
		
		result = jsonObject.toString();
		
		return "warehouse";
	}
	
	public String refuseOrder()
	{
		order = orderService.getOneOrder(order.getOrderId());
		System.out.println("hehe==========");
		if(order.getOrderState().getOrderStateId().equals("1"))
		{
			OrderState orderstatetmp = new OrderState();			
			orderstatetmp.setOrderStateId("3");//拒单状态
			order.setOrderState(orderstatetmp);
			orderService.updateOrder(order);
		}
		
		
		return "refuse success";
	}
	
	
	public String CommentDetails()
	{
		//System.out.println("++++++++++++++++"+good.getGoodId()+"--------"+order.getOrderId());
		ordergood = orderService.getOrderGoodByGoodAndOrder(order.getOrderId(), good.getGoodId());
		
		return "back comment success";
	}
	public String managecomment()
	{
		ordergood.setCommentState("双方已评");
		if(orderService.updateOrderGood(ordergood))
		{
			return "manage commment";
		}
		else
		{
			return "error";
		}
		
		
	}
	/**
	 * 获取个人订单
	 * @author Hai
	 * @return
	 * no userful
	 */
	public String getPersonalOrder()
	{
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		//String userId = "1";
		List<Order> orderlisttmp = new ArrayList<Order>();
		orderlisttmp = orderService.getOrderByUserId(userId);
		
		bindFun(orderlisttmp);
		this.setOrderlist(orderlisttmp);
		//System.out.println("我就要看看你多大"+this.getOrderlist().size());
		return "get personal";
	}
	
	public String getPersonUnsolveOrder()
	{
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		//String userId = "1";
		
		orderlist = orderService.getOrderByStateAndUserId(STATE_UNSOLVE,userId);
		//orderlist = orderService.getOrderByState();	
		
		bindFun(orderlist);
		
		return "get order by state userid";
	}
	public String getPersonAcceptOrder()
	{
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		//String userId = "1";
		orderlist = orderService.getOrderByStateAndUserId(STATE_ACCEPT,userId);
		bindFun(orderlist);
		return "get order by state userid";
	}
	public String getPersonRefuseOrder()
	{
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		//String userId = "1";
		orderlist = orderService.getOrderByStateAndUserId(STATE_REFUSE,userId);
		bindFun(orderlist);
		return "get order by state userid";
	}
	public String getPersonFinishOrder()
	{
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		//String userId = "1";
		orderlist = orderService.getOrderByStateAndUserId(STATE_FINISH,userId);
		bindFun(orderlist);
		return "get order by state userid";
	}
	
	
	
	
	/*
	 * 绑定订单状态
	 * @author Hai
	 * no useful
	 */
	public void bindFun2(List<Order> orderlisttmp)//no useful
	{		
		List<OrderState> orderStateLittmp = new ArrayList<OrderState>();
		List<List<OrderGood>> ordergoodListListtmp = new ArrayList<List<OrderGood>>();
		List<OrderGood> ordergoodListtmp = new ArrayList<OrderGood>();
		List<Good> goodListtmp = new ArrayList<Good>();
		List<List<Good>> goodListListtmp = new ArrayList<List<Good>>();
		
		for(int i=0;i<orderlisttmp.size();i++)
		{								
			OrderState o = orderService.getOneOrderState(orderlisttmp.get(i).getOrderState());	
			ordergoodListtmp = orderService.getGoodByOrderId(orderlisttmp.get(i));
			for(int j=0;j<ordergoodListtmp.size();j++)
			{
				goodListtmp.add(goodService.getOneGood(ordergoodListtmp.get(j).getGood().getGoodId()));
			}
			/*for(int j=0;j<goodListtmp.size();j++)
			{
				System.out.println("评论"+goodListtmp.get(j).getCommentState());
			}
			*/
			orderStateLittmp.add(o);	
			ordergoodListListtmp.add(ordergoodListtmp);
			goodListListtmp.add(goodListtmp);
		}		
		this.setGoodListList(goodListListtmp);
		//System.out.println("----------------------------------------------------"+this.goodListList.size());
		this.setOrderStateList(orderStateLittmp);
		this.setOrdergoodListList(ordergoodListListtmp);
	}
	
	
	
	@Resource(name="orderService")
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public OrderService getOrderService() {
		return orderService;
	}

	public OrderGoodService getOrderGoodService() {
		return orderGoodService;
	}

	@Resource(name="orderGoodService")
	public void setOrderGoodService(OrderGoodService orderGoodService) {
		this.orderGoodService = orderGoodService;
	}

	
	public List<Order> getOrderlist() {
		return orderlist;
	}

	public void setOrderlist(List<Order> orderlist) {
		this.orderlist = orderlist;
	}
	public Order getOrder() {
		return order;
	}
	public String getSTATE() {
		return STATE;
	}

	public void setSTATE(String sTATE) {
		STATE = sTATE;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public OrderState getOrderstate() {
		return orderstate;
	}

	public void setOrderstate(OrderState orderstate) {
		this.orderstate = orderstate;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public List<Warehouse> getWarelist() {
		return warelist;
	}
	public void setWarelist(List<Warehouse> warelist) {
		this.warelist = warelist;
	}
	
	public WarehouseService getWarehouseService() {
		return warehouseService;
	}
	@Resource(name="warehouseService")
	public void setWarehouseService(WarehouseService warehouseService) {
		this.warehouseService = warehouseService;
	}
	
	
	public List<Customer> getCustomerList() {
		
		return customerList;
	}
	public void setCustomerList(List<Customer> customerList) {
		
		this.customerList = customerList;
	}
	public List<OrderState> getOrderStateList() {
		return orderStateList;
	}
	public void setOrderStateList(List<OrderState> orderStateList) {
		this.orderStateList = orderStateList;
	}
	public CustomerService getCustomerService() {
		return customerService;
	}
	@Resource(name="customerService")
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	public List<OrderGood> getOrdergoodList() {
		return ordergoodList;
	}
	public void setOrdergoodList(List<OrderGood> ordergoodList) {
		this.ordergoodList = ordergoodList;
	}
	public OrderGood getOrdergood() {
		return ordergood;
	}
	
	public void setOrdergood(OrderGood ordergood) {
		this.ordergood = ordergood;
	}
	public Good getGood() {
		return good;
	}
	public void setGood(Good good) {
		this.good = good;
	}
	public GoodService getGoodService() {
		return goodService;
	}
	@Resource(name="goodService")
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}
	public List<Good> getGoodList() {
		return goodList;
	}
	public void setGoodList(List<Good> goodList) {
		this.goodList = goodList;
	}
	public String getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}
	public List<List<OrderGood>> getOrdergoodListList() {
		return ordergoodListList;
	}
	public void setOrdergoodListList(List<List<OrderGood>> ordergoodListList) {
		this.ordergoodListList = ordergoodListList;
	}
	public List<List<Good>> getGoodListList() {
		return goodListList;
	}
	public void setGoodListList(List<List<Good>> goodListList) {
		this.goodListList = goodListList;
	}
	public String getOrderStateId() {
		return orderStateId;
	}
	public void setOrderStateId(String orderStateId) {
		this.orderStateId = orderStateId;
	}


	public int getOrderGoodId() {
		return orderGoodId;
	}


	public void setOrderGoodId(int orderGoodId) {
		this.orderGoodId = orderGoodId;
	}

	

	
	
	
	
	
	
}
