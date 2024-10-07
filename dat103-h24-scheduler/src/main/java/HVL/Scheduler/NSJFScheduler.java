package HVL.Scheduler;

import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.Queue;

public class NSJFScheduler implements Scheduler {

	private Queue<Task> ready;
	private Task selected;

	NSJFScheduler() {
		this.ready = new ArrayDeque<>();
	}

	@Override
	public Optional<Integer> scheduled() {
		if (selected == null)
			return Optional.empty();
		return Optional.of(selected.getId());
	}

	@Override
	public List<Integer> ready() {
		return ready.stream().map(Task::getId).toList();
	}

	// Task 2: Complete the implementation of Non-preemptive Shortest Job First
	@Override
	public void addTask(Task task) {
		Iterator<Task> iterator = ready.iterator();
		int position = 0;

		while (iterator.hasNext()) {
			Task current = iterator.next();
			if (task.getSize() < current.getSize()) {
				break;
			}
			position++;
		}

		LinkedList<Task> tempList = new LinkedList<>(ready);
		tempList.add(position, task);
		ready = new ArrayDeque<>(tempList);
	}

	@Override
	public void schedule() {
		if (selected == null) {
			selected = ready.poll();
			if (selected == null) {
				return;
			}
			selected.start();
		} else {
			// Task 2: Complete the implementation of Non-preemptive Shortest Job First
			if (!selected.isDone()) {
				return;
			} else {
                selected = null;
                schedule();
			}
		}
	}

}
